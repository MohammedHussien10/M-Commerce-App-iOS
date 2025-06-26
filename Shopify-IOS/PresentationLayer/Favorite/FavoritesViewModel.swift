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
    @Published var favoriteProducts: [Product] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    private var cancellables = Set<AnyCancellable>()

    private var customerEmail: String {
        UserDefaults.standard.string(forKey: "CurrentCustomerEmail") ?? ""
    }

    func fetchFavorites() {
        guard !customerEmail.isEmpty else {
            errorMessage = "No email found for current user."
            return
        }

        isLoading = true
        errorMessage = nil

        FirestoreManager.shared.fetchFavoritesPublisher(email: customerEmail)
            .map { data in
                data.compactMap { $0["productID"] as? String }
            }
            .flatMap { productIDs in
                let query = StoreFrontNameSpace.GetAllProductsQuery(first: 100)

                return Future<[Product], Error> { promise in
                    NetworkManager.sharedStoreFront.queryGraphQLRequest(query: query) { result in
                        switch result {
                        case .success(let data):
                            let allProducts = data.products.toDomain()
                            let cleanIDs = productIDs.map { FirestoreManager.shared.extractNumericID(from: $0) }
                            let matchingProducts = allProducts.filter {
                                cleanIDs.contains(FirestoreManager.shared.extractNumericID(from: $0.id))
                            }
                            promise(.success(matchingProducts))
                        case .failure(let error):
                            promise(.failure(error))
                        }
                    }
                }
                .eraseToAnyPublisher()
            }
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                self?.isLoading = false
                if case .failure(let error) = completion {
                    self?.errorMessage = "Failed to load favorites: \(error.localizedDescription)"
                }
            }, receiveValue: { [weak self] products in
                self?.favoriteProducts = products
            })
            .store(in: &cancellables)
    }
}
