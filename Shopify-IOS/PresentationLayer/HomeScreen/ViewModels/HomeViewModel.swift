//
//  HomeViewModel.swift
//  Shopify-IOS
//
//  Created by Noha Ali Gomaa on 08/06/2025.
//

import Foundation
import Combine
import StoreFrontNameSpace

class HomeViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var collections: [CollectionModel] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    func fetchProducts() {
        isLoading = true
        errorMessage = nil
        
        let query = StoreFrontNameSpace.GetAllProductsQuery(first: 100)
        
        NetworkManager.sharedStoreFront.queryGraphQLRequest(query: query) { [weak self ]result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let success):
                    self?.products = success.products.toDomain()
                    print(self?.products.first?.title)
                case .failure(let failure):
                    self?.errorMessage = failure.localizedDescription
                }
            }
        }
    }
    func fetchCollections() {
         isLoading = true
         errorMessage = nil

        let query =  StoreFrontNameSpace.GetCollectionsQuery(first: 50)

         NetworkManager.sharedStoreFront.queryGraphQLRequest(query: query) { [weak self] result in
             DispatchQueue.main.async {
                 self?.isLoading = false
                 switch result {
                 case .success(let success):
                     let models = success.collections.nodes.compactMap { $0.toDomain() }
                     self?.collections = models
                     print("collections \(self?.collections.first?.title)")
                 case .failure(let failure):
                     self?.errorMessage = failure.localizedDescription
                 }
             }
         }
     }
}
