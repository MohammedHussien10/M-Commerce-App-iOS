//
//  ProductDetailsViewModel.swift
//  Shopify-IOS
//
//  Created by Aya Emam on 12/06/2025.
//
import Foundation
import Combine
class ProductDetailsViewModel: ObservableObject {
    @Published private var product: Product
    @Published var isLoading = false
    @Published var errorMessage: String?
    func fetchProducts() {
        isLoading = true
        errorMessage = nil
        
        let query = GraphQLCodeGen.GetAllProductsQuery(first: 10)
        
        NetworkManager.sharedStoreFront.queryGraphQLRequest(query: query) { [weak self ]result in
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

    init(product: Product) {
        self.product = product
    }
    var imageUrl: [URL] {
        return product.images
    }
    var Title: String {
        return product.title.uppercased()
    }

    var vendor: String {
        return "Vendor: \(product.vendor)"
    }
    var description: String {
        return product.descriptionHtml
    }
    var price: String {
        return "\(product.variants.first!.price.amount) \(product.variants.first!.price.currencyCode)"
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

}

