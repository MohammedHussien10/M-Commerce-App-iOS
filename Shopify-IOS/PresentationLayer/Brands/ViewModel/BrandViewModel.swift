//
//  BrandViewModel.swift
//  Shopify-IOS
//
//  Created by Noha Ali Gomaa on 15/06/2025.
//

import Foundation
import StoreFrontNameSpace

class BrandViewModel : ObservableObject {
    @Published var products: [Product] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
  
    func fetchCollectionProducts(handle: String) {
        isLoading = true
        errorMessage = nil
        
        let handle: GraphQLNullable<String> = .some(handle)
        let first: GraphQLNullable<Int> = .some(20)
        let query = StoreFrontNameSpace.GetCollectionQuery(handle: handle, first: first)
        
        NetworkManager.sharedStoreFront.queryGraphQLRequest(query: query) { [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }
                self.isLoading = false
                
                switch result {
                case .success(let response):
                    self.products = response.collection?.products.nodes.map { $0.toDomain() } ?? []
                    print("First product title: \(self.products.first?.title ?? "None")")
                    
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    print("Error fetching collection products:", error)
                }
            }
        }
    }

}
