//
//  SearchViewModel.swift
//  Shopify-IOS
//
//  Created by Aya Emam on 13/06/2025.
//

import Foundation
import Combine
import StoreFrontNameSpace

class SearchViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var products: [Product] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    private var allProducts: [Product] = [] 
    private var cancellables = Set<AnyCancellable>()
    @Published var maxPrice: Double = 500
    @Published var currentMaxPrice: Double = 500

    init() {
        fetchAllProducts()
        observeSearchText()
    }

    private func fetchAllProducts() {
        isLoading = true
        let query = StoreFrontNameSpace.GetAllProductsQuery(first: 100)

        NetworkManager.sharedStoreFront.queryGraphQLRequest(query: query) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let data):
                    let products = data.products.toDomain()
                    self?.allProducts = products
                    self?.products = products
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }

    private func observeSearchText() {
        $searchText
            .combineLatest($currentMaxPrice)
            .throttle(for: .milliseconds(300), scheduler: DispatchQueue.main, latest: true)
            .sink { [weak self] (text, maxPrice) in
                guard let self else { return }
                self.products = self.allProducts.filter { product in
                    let priceString = product.variants.first?.price.amount
                    let price = Double(priceString!) 

                    let matchesText = text.isEmpty ||
                        product.title.localizedCaseInsensitiveContains(text) ||
                        product.vendor.localizedCaseInsensitiveContains(text) ||
                        product.productType.localizedCaseInsensitiveContains(text)

                    return matchesText && price <= maxPrice
                }
            }
            .store(in: &cancellables)
    }

}
