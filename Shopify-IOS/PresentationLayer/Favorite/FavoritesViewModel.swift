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
    
    private let customerID = UserDefaults.standard.string(forKey: "CurrentCustomerID") ?? ""
    
    func fetchFavorites() {
        isLoading = true
        errorMessage = nil
        DraftOrderManager.shared.fetchDraftOrders { [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }
                
                switch result {
                case .success(let orders):
                    guard let order = orders.first(where: { $0.note2 == self.customerID }) else {
                        self.favoriteProducts = []
                        self.isLoading = false
                        return
                    }
                    
                    let items = order.lineItems.nodes.compactMap { $0 }
                    let variantIDs = items.compactMap { $0.variant?.id }
                    self.favoriteVariantIDs = variantIDs
                    
                    self.fetchFullProductsMatchingFavorites()
                    
                case .failure(let error):
                    if error.localizedDescription.contains("Throttled") {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            self.fetchFavorites()
                        }
                    }
                    self.errorMessage = error.localizedDescription
                    self.isLoading = false
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
                    self.favoriteProducts = matchingProducts

                case .failure(let error):
                    
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

