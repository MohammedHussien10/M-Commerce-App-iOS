//
//  SearchViewModel.swift
//  Shopify-IOS
//
//  Created by Aya Emam on 13/06/2025.
//

import Foundation
import Combine

class SearchViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var products: [Product] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    private var allProducts: [Product] = [] 
    private var cancellables = Set<AnyCancellable>()

    init() {
        fetchAllProducts()
        observeSearchText()
    }

    private func fetchAllProducts() {
        isLoading = true
        let query = GraphQLCodeGen.GetAllProductsQuery(first: 100)

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
            .throttle(for: .milliseconds(500), scheduler: DispatchQueue.global(), latest: true)
            .removeDuplicates()
            .receive(on: RunLoop.main)
            .sink { [weak self] text in
                guard let self else { return }
                if text.isEmpty {
                    products = allProducts
                } else {
                    products = allProducts.filter {
                        $0.title.localizedCaseInsensitiveContains(text) ||
                        $0.vendor.localizedCaseInsensitiveContains(text) ||
                        $0.productType.localizedCaseInsensitiveContains(text)
                    }
                }
            }
            .store(in: &cancellables)
    }
}
