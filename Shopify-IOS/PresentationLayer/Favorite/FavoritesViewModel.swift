//
//  FavoritesViewModel.swift
//  Shopify-IOS
//
//  Created by Aya Emam on 24/06/2025.
//
import Foundation
import Combine
import AdminNameSpace
import StoreFrontNameSpace

class FavoritesViewModel: ObservableObject {
    @Published var favoriteVariants: [FavoriteVariantModel] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var favoriteVariantIDs: [String] = []
    @Published var favoriteProducts: [Product] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    private var customerID: String {
        return UserDefaults.standard.string(forKey: "CurrentCustomerID") ?? ""
    }
    
    init() {
        setupNotificationObservers()
    }
    
    deinit {
        cancellables.removeAll()
    }
    
    private func setupNotificationObservers() {
        NotificationCenter.default.publisher(for: NSNotification.Name("UserLoggedIn"))
            .sink { [weak self] _ in
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    self?.fetchFavorites()
                }
            }
            .store(in: &cancellables)
        
        NotificationCenter.default.publisher(for: NSNotification.Name("UserLoggedOut"))
            .sink { [weak self] _ in
                DispatchQueue.main.async {
                    self?.clearFavorites()
                }
            }
            .store(in: &cancellables)
    }
    
    private func clearFavorites() {
        favoriteProducts = []
        favoriteVariantIDs = []
        favoriteVariants = []
    }
    
    func fetchFavorites() {
        guard !customerID.isEmpty else {
            print("No customer ID available for fetching favorites")
            favoriteProducts = []
            return
        }
        
        isLoading = true
        errorMessage = nil
        
        print("Fetching favorites for customer: \(customerID)")
        
        DraftOrderManager.shared.fetchDraftOrders { [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }
                
                switch result {
                case .success(let orders):
                    print("Found \(orders.count) draft orders")
                    
                    guard let order = orders.first(where: { $0.note2 == self.customerID }) else {
                        print("No draft order found for customer: \(self.customerID)")
                        self.favoriteProducts = []
                        self.favoriteVariantIDs = []
                        self.isLoading = false
                        return
                    }
                    
                    print("Found draft order for customer")
                    let items = order.lineItems.nodes.compactMap { $0 }
                    let variantIDs = items.compactMap { $0.variant?.id }
                    self.favoriteVariantIDs = variantIDs
                    
                    print("Found \(variantIDs.count) favorite variants")
                    
                    if !variantIDs.isEmpty {
                        self.fetchFullProductsMatchingFavorites()
                    } else {
                        self.favoriteProducts = []
                        self.isLoading = false
                    }
                    
                case .failure(let error):
                    print("Error fetching draft orders: \(error.localizedDescription)")
                    
                    if error.localizedDescription.contains("Throttled") {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            self.fetchFavorites()
                        }
                    } else {
                        self.errorMessage = error.localizedDescription
                        self.isLoading = false
                    }
                }
            }
        }
    }
    
    func fetchFullProductsMatchingFavorites() {
        let query = StoreFrontNameSpace.GetAllProductsQuery(first: 100)

        NetworkManager.sharedStoreFront.queryGraphQLRequest(query: query) { [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }
                self.isLoading = false

                switch result {
                case .success(let data):
                    let allProducts = data.products.toDomain()
                    let matchingProducts = allProducts.filter { product in
                        product.variants.contains { variant in
                            self.favoriteVariantIDs.contains(variant.id)
                        }
                    }
                    
                    print("Found \(matchingProducts.count) matching products for favorites")
                    self.favoriteProducts = matchingProducts

                case .failure(let error):
                    print("Error fetching products: \(error.localizedDescription)")
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
}

struct FavoriteVariantModel: Identifiable {
    var id: String { variantID }
    let title: String
    let quantity: Int
    let variantID: String
    let imageUrl: Foundation.URL?
}
