import Foundation
import Combine
import StoreFrontNameSpace
import AdminNameSpace

class ProductDetailsViewModel: ObservableObject {
    // MARK: - Published Properties
    @Published var product: Product
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var isFavorited = false

    // MARK: - Private Properties
    private let currency = UserDefaults.standard.string(forKey: "selectedCurrency") ?? "USD"
    private var draftOrderID: String?
    private var currentLineItems: [AdminNameSpace.DraftOrderLineItemInput] = []
    private var cancellables = Set<AnyCancellable>()

    private var customerID: String { UserDefaults.standard.string(forKey: "CurrentCustomerID") ?? "" }
    private var customerEmail: String { UserDefaults.standard.string(forKey: "CurrentCustomerEmail") ?? "" }
    private var variantID: String { product.variants.first?.id ?? "" }

    // MARK: - Init
    init(product: Product) {
        self.product = product
        observeUserSessionChanges()
        loadFavoriteStatus()
    }

    deinit { cancellables.removeAll() }

    // MARK: - Session Observers
    private func observeUserSessionChanges() {
        NotificationCenter.default.publisher(for: NSNotification.Name("UserLoggedIn"))
            .sink { [weak self] _ in self?.refreshFavoriteStatus() }
            .store(in: &cancellables)

        NotificationCenter.default.publisher(for: NSNotification.Name("UserLoggedOut"))
            .sink { [weak self] _ in self?.clearFavoriteStatus() }
            .store(in: &cancellables)
    }

    private func clearFavoriteStatus() {
        isFavorited = false
        draftOrderID = nil
        currentLineItems = []
    }

    func refreshFavoriteStatus() {
        loadFavoriteStatus()
    }

    // MARK: - Favorites
    func loadFavoriteStatus() {
        clearFavoriteStatus()
        guard !customerID.isEmpty else {
            print("No customer ID")
            return
        }

        DraftOrderManager.shared.fetchDraftOrders { [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }

                switch result {
                case .success(let orders):
                    guard let order = orders.first(where: { $0.note2 == self.customerID }) else {
                        print("No draft order found for customer")
                        return
                    }

                    self.draftOrderID = order.id
                    let items = order.lineItems.nodes.compactMap { $0 }

                    self.isFavorited = items.contains { $0.variant?.id == self.variantID }
                    self.currentLineItems = items.map {
                        .init(quantity: $0.quantity, variantId: .some($0.variant?.id ?? ""))
                    }

                case .failure(let error):
                    print("Failed to fetch favorites: \(error.localizedDescription)")
                }
            }
        }
    }

    func toggleFavorite() {
        guard !customerID.isEmpty, !customerEmail.isEmpty else {
            print("Missing customer info")
            return
        }

        isFavorited.toggle()

        isFavorited ? addToFavorites() : removeFromFavorites()
    }

    private func addToFavorites() {
        let lineItem = AdminNameSpace.DraftOrderLineItemInput(quantity: 1, variantId: .some(variantID))

        if let draftID = draftOrderID {
            currentLineItems.append(lineItem)
            DraftOrderManager.shared.updateDraftOrder(draftOrderID: draftID, updatedLineItems: currentLineItems) { result in
                if case .failure(let error) = result {
                    print("Failed to update draft order: \(error)")
                }
            }
        } else {
            DraftOrderManager.shared.createDraftOrder(customerEmail: customerEmail, customerID: customerID, variantID: variantID) { [weak self] result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let order):
                        self?.draftOrderID = order.id
                        self?.currentLineItems = order.lineItems.nodes.compactMap {
                            .init(quantity: $0.quantity, variantId: .some($0.variant?.id ?? ""))
                        }

                    case .failure(let error):
                        print("Failed to create draft order: \(error)")
                        self?.isFavorited = false
                    }
                }
            }
        }
    }

    private func removeFromFavorites() {
        currentLineItems.removeAll {
            $0.variantId == .some(variantID)
        }

        guard let draftID = draftOrderID else { return }

        DraftOrderManager.shared.updateDraftOrder(draftOrderID: draftID, updatedLineItems: currentLineItems) { result in
            if case .failure(let error) = result {
                print("Failed to remove from favorites: \(error)")
            }
        }
    }

    // MARK: - Computed Properties for UI
    var imageUrl: [Foundation.URL] { product.images }

    var title: String {
        product.title.split(separator: "|").dropFirst().joined(separator: "|").trimmingCharacters(in: .whitespaces)
    }

    var vendor: String { "Vendor: \(product.vendor)" }

    var description: String { product.descriptionHtml }

    var price: String {
        product.variants.first?.price.amount.priceFormatter(with: currency) ?? ""
    }

    var sizes: [String] {
        Array(Set(product.variants
            .flatMap { $0.selectedOptions }
            .filter { $0.name.lowercased() == "size" }
            .map { $0.value })).sorted()
    }

    var colorOptions: [String] {
        Array(Set(product.variants
            .flatMap { $0.selectedOptions }
            .filter { $0.name.lowercased() == "color" }
            .map { $0.value })).sorted()
    }

    // MARK: - Test API Call
    func fetchProducts() {
        isLoading = true
        errorMessage = nil

        NetworkManager.sharedStoreFront.queryGraphQLRequest(query: StoreFrontNameSpace.GetAllProductsQuery(first: 10)) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let data):
                    if let product = data.products.toDomain().first {
                        self?.product = product
                    }
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
