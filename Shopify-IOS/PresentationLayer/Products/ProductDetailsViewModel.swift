//
//  ProductDetailsViewModel.swift
//  Shopify-IOS
//
//  Created by Aya Emam on 12/06/2025.
//

import Foundation
import Combine
import StoreFrontNameSpace
import AdminNameSpace

class ProductDetailsViewModel: ObservableObject {
    @Published var product: Product
    @Published var isLoading = false
    @Published var errorMessage: String?
    let currency = UserDefaults.standard.string(forKey: "selectedCurrency") ?? "USD"

    @Published var isFavorited = false
    private var draftOrderID: String?
    private var currentLineItems: [AdminNameSpace.DraftOrderLineItemInput] = []
    
    private let customerID = UserDefaults.standard.string(forKey: "CurrentCustomerID") ?? ""
    private let customerEmail = UserDefaults.standard.string(forKey: "CurrentCustomerEmail") ?? ""

    private var variantID: String {
        return product.variants.first?.id ?? ""
    }

    init(product: Product) {
        self.product = product
        loadFavoriteStatus()
    }

    func loadFavoriteStatus() {
        DraftOrderManager.shared.fetchDraftOrders { [weak self] result in
            guard let self = self else { return }

            switch result {
            case .success(let orders):
                if let order = orders.first(where: { $0.note2 == self.customerID }) {
                    self.draftOrderID = order.id
                    let items = order.lineItems.nodes.compactMap { $0 }

                    self.isFavorited = items.contains { (item: DraftOrdersQuery.Data.DraftOrders.Node.LineItems.Node) in
                        (item.variant?.id ?? "") == self.variantID
                    }


                    self.currentLineItems = items.map { item in
                        AdminNameSpace.DraftOrderLineItemInput(
                            quantity: item.quantity,
                            variantId: .some(item.variant?.id ?? "")
                        )
                    }
                } else {
                    self.isFavorited = false
                }

            case .failure(let error):
                print("Favorites fetch error: \(error.localizedDescription)")
                self.isFavorited = false
            }
        }
    }

    func toggleFavorite() {
        isFavorited.toggle()

        if isFavorited {
            if let draftID = draftOrderID {
                currentLineItems.append(
                    AdminNameSpace.DraftOrderLineItemInput(
                        quantity: 1,
                        variantId: .some(variantID)
                    )
                )
                DraftOrderManager.shared.updateDraftOrder(draftOrderID: draftID, updatedLineItems: currentLineItems) { _ in }
            } else {
                DraftOrderManager.shared.createDraftOrder(customerEmail: customerEmail, customerID: customerID, variantID: variantID) { [weak self] result in
                    guard let self = self else { return }

                    if case .success(let order) = result {
                        self.draftOrderID = order.id
                        let orderItems = order.lineItems.nodes.compactMap { $0 }

                        self.currentLineItems = orderItems.map { item in
                            AdminNameSpace.DraftOrderLineItemInput(
                                quantity: item.quantity,
                                variantId: .some(item.variant?.id ?? "")
                            )
                        }
                    }
                }
            }
        } else {
            currentLineItems.removeAll {
                switch $0.variantId {
                case .some(let id):
                    return id == variantID
                case .null:
                    return false
                case .none:
                    return false
                }
            }



            if let draftID = draftOrderID {
                DraftOrderManager.shared.updateDraftOrder(draftOrderID: draftID, updatedLineItems: currentLineItems) { _ in }
            }
        }
    }

    var imageUrl: [Foundation.URL] {
        return product.images
    }

    var Title: String {
//        return product.title.uppercased()
        let parts = product.title.split(separator: "|")
        return(parts.count > 1 ? String(parts[1]) : product.title)
           
    }

    var vendor: String {
        return "Vendor: \(product.vendor)"
    }

    var description: String {
        return product.descriptionHtml
    }

    var price: String {
        return "\(product.variants.first!.price.amount.priceFormatter(with: currency))"
    }

    var sizes: [String] {
        let allSizes = product.variants
            .flatMap { $0.selectedOptions }
            .filter { $0.name.lowercased() == "size" }
            .map { $0.value }
        return Array(Set(allSizes)).sorted()
    }

    var colorOptions: [String] {
        let colors = product.variants
            .flatMap { $0.selectedOptions }
            .filter { $0.name.lowercased() == "color" }
            .map { $0.value }
        return Array(Set(colors)).sorted()
    }

    func fetchProducts() {
        isLoading = true
        errorMessage = nil
        
        let query = StoreFrontNameSpace.GetAllProductsQuery(first: 10)
        
        NetworkManager.sharedStoreFront.queryGraphQLRequest(query: query) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let success):
                    self?.product = success.products.toDomain().first!
                case .failure(let failure):
                    self?.errorMessage = failure.localizedDescription
                }
            }
        }
    }
}
