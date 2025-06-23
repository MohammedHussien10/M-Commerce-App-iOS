//
//  CategoryViewModel.swift
//  Shopify-IOS
//
//  Created by Noha Ali Gomaa on 18/06/2025.
//

import Foundation
import StoreFrontNameSpace

class CategoryViewModel: ObservableObject {
    @Published var items: [Product]?
    @Published var isLoading: Bool = true
    @Published var iserror: Bool = false
    @Published  var filterBy: String = "All"
    @Published  var activeTag: String = "All"
    @Published var arrFilter: [String] = []
    @Published var tags: [String] = []
    @Published var products :[Product] = []
    @Published var errorMessage: String?
    @Published var searchText: String = ""
    
    @Published var selectedPriceRange: ClosedRange<Double> = 50...250
    var allProductsPriceRange: ClosedRange<Double> {
        let prices = items?.compactMap { product in
            Double(product.variants.first?.price.amount ?? 0)
        } ?? [0]

        return (prices.min() ?? 0)...(prices.max() ?? 0)
    }
    var randomNumberFiftyToTwoHundredFifty: Int {
        return Int.random(in: 50...250)
    }
    
    init(){
        fetchProducts()
    }
    
    func fetchProducts() {
        isLoading = true
        errorMessage = nil
        
        let query = StoreFrontNameSpace.GetAllProductsQuery(first: 100)
        
        NetworkManager.sharedStoreFront.queryGraphQLRequest(query: query) { [weak self ]result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let success):
                    DispatchQueue.main.async {
                        self?.items =  success.products.toDomain()
                        self?.isLoading = false
                        self?.onAppearView()
                    }
                case .failure(let failure):
                    self?.errorMessage = failure.localizedDescription
                }
            }
        }
    }
    
    func onAppearView(){
        products = items ?? []
         tags = ["All"]
         getTags(products: items ?? []).forEach({ tag in
             tags.append(tag)
         })
         arrFilter = ["All"]
         getType(products: items ?? []).forEach({ tag in
             arrFilter.append(tag)
         })
         selectedPriceRange = allProductsPriceRange
    }
    
    func filterTag(){
        if(self.filterBy == "All"){
            products =  items ?? []
            if(activeTag == "All"){
                products =  items ?? []
            }else{
                products =  items?.filter { Product in
                    if Product.tags.contains(activeTag) {
                        return true
                    } else {
                        return false
                    }
                } ?? []
            }
        }else{
            if(activeTag == "All"){
                products =  items ?? []
            }else{
                products =  items?.filter { Product in
                    if Product.tags.contains(activeTag) {
                        return true
                    } else {
                        return false
                    }
                } ?? []
            }
            products =  products.filter { Product in
                if Product.productType.contains(filterBy) {
                    return true
                } else {
                    return false
                }
            }
        }
        products = products.filter { product in
            if let price = product.variants.first?.price.amount {
                return selectedPriceRange.contains(price)
            }
            return false
        }
    }
    
    func filter(){
        if(activeTag == "All"){
            products =  items ?? []
            if(self.filterBy == "All"){}else{
                products =  products.filter { Product in
                    if Product.productType.contains(self.filterBy) {
                        return true
                    } else {
                        return false
                    }
                }
            }
        }else{
            products =  items?.filter { Product in
                if Product.tags.contains(activeTag) {
                    return true
                } else {
                    return false
                }
            } ?? []
            if(self.filterBy == "All"){}else{
                products =  products.filter { Product in
                    if Product.productType.contains(self.filterBy) {
                        return true
                    } else {
                        return false
                    }
                }
            }
        }
        products = products.filter { product in
            if let price = product.variants.first?.price.amount {
                return selectedPriceRange.contains(price)
            }
            return false
        }
    }
    
    //search
    func searchProducts(query: String) {
        searchText = query
        
        // Base set
        var filtered = items ?? []
        
        // Filter by search text
        if !query.isEmpty {
            filtered = filtered.filter { product in
                product.title.lowercased().contains(query.lowercased())
            }
        }
        
        // Filter by activeTag
        if activeTag != "All" {
            filtered = filtered.filter { product in
                product.tags.contains(activeTag)
            }
        }

        // Filter by productType
        if filterBy != "All" {
            filtered = filtered.filter { product in
                product.productType.contains(filterBy)
            }
        }

        // Update the published product list
        products = filtered
    }
    
    func filterByPrice() {
        self.products = items?.filter { product in
            guard let price = product.variants.first?.price.amount else { return false }
            return selectedPriceRange.contains(price)
        } ?? []
    }
}


