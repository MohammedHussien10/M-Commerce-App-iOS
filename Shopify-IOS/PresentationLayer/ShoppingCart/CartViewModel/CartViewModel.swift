//
//  CartViewModel.swift
//  Shopify-IOS
//
//  Created by Macos on 18/06/2025.
//

import Foundation
import AdminNameSpace
import StoreFrontNameSpace

class CartViewModel: ObservableObject {
    @Published var cartId: String? = UserDefaults.standard.string(forKey: "CartID")
    @Published var cartProducts: [CartProduct] = []
    @Published var shouldProceedCheckingOut: Bool = false
    private let useCase: CartUseCaseProtocol

    init(useCase: CartUseCaseProtocol) {
        self.useCase = useCase
        if UserDefaults.standard.string(forKey: "CartID") == nil {
            createCartIfNeeded()
        }
    }

    func createCartIfNeeded() {
        useCase.createCart { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let cartId):
                    UserDefaults.standard.set(cartId, forKey: "CartID")
                    self?.cartId = cartId
                    self?.loadCartProducts()
                case .failure(let error):
                    print("Failed to create cart:", error)
                }
            }
        }
    }


    func addProduct(productId: String, quantity: Int) {
        guard let cartId = cartId else { return }
        useCase.addToCart(cartId: cartId, productId: productId, quantity: quantity) {[weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success:
                    print("Product added to cart")
                    self?.loadCartProducts()
                case .failure(let error):
                    print("Failed to add to cart:", error)
                }
            }
        }
    }
    
    func loadCartProducts() {
        guard let cartId = cartId else { return }
        
        useCase.getCart(cartId: cartId) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let cart):
                    let products = cart.lines.edges.compactMap { edge -> CartProduct? in
                        guard let variant = edge.node.merchandise.asProductVariant else { return nil }

                        return CartProduct(
                            id: edge.node.id,
                            Variantid: variant.id,
                            quantity: edge.node.quantity,
                            title: variant.title,
                            imageURL: variant.image?.url ?? "",
                            price: Double(variant.price.amount) ?? 0.0
                        )
                    }
                    self?.cartProducts = products
                    self?.shouldProceedCheckingOut = !products.isEmpty
                case .failure(let error):
                    print("Failed to load cart: \(error.localizedDescription)")
                }
            }
        }
    }

    
    func updateProductQuantity(cartId: String, lineId: String, newQuantity: Int) {
        if let index = cartProducts.firstIndex(where: { $0.id == lineId }) {
            var updatedProduct = cartProducts[index]
            updatedProduct.quantity = newQuantity
            cartProducts[index] = updatedProduct 
        }


        useCase.updateCartLine(cartId: cartId, lineId: lineId, quantity: newQuantity) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success:
                    print("Quantity updated successfully")
                    self?.loadCartProducts() 
      
                case .failure(let error):
                    print("Failed to update quantity:", error)
                }
            }
        }
    }


    func removeProduct(lineId: String) {
        guard let cartId = cartId else { return }
        useCase.removeCartLine(cartId: cartId, lineId: lineId) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success:
                    print("Product removed from cart")
                    self?.loadCartProducts()
                case .failure(let error):
                    print("Failed to remove product: \(error.localizedDescription)")
                }
            }
        }
    }

    func getFirstProductUnderVariants(variants: [Variant]) -> CartProduct? {
        cartProducts.first { product in
            variants.contains(where: { $0.id == product.Variantid })
        }
    }

    func completeOrder() async {
        DispatchQueue.main.async {[weak self] in
            self?.cartProducts = []
            self?.cartId = nil
            self?.shouldProceedCheckingOut = false
        }
        UserDefaults.standard.removeObject(forKey: "CartID")
        createCartIfNeeded()
    }
}
