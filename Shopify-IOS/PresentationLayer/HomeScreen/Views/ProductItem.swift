import SwiftUI
import Kingfisher

struct ProductItem: View {
    let product: Product
    @EnvironmentObject var cartViewModel: CartViewModel
    @StateObject private  var  productViewModel:ProductDetailsViewModel
    @Binding var isTabBarHidden: Bool
    let currency = UserDefaults.standard.string(forKey: "selectedCurrency") ?? "USD"
    
    @State private var isFavorited = false
    @State private var isAddedToCart = false
    @State private var pressCount = 0
    private var isOutOfStock: Bool {
        product.variants.first?.availableForSale == false
    }
    
    init(product: Product, isTabBarHidden: Binding<Bool>) {
         self.product = product
         self._isTabBarHidden = isTabBarHidden
        _productViewModel = StateObject(wrappedValue: ProductDetailsViewModel(product: product))
     }

    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack(alignment: .leading, spacing: 6) {
                NavigationLink(destination: ProductDetailsView(viewModel: productViewModel, isTabBarHidden: $isTabBarHidden)) {
                    VStack(alignment: .leading, spacing: 4) {
                        // Image
                        KFImage(product.images.first ?? URL(string: "https://theperfectroundgolf.com/wp-content/uploads/2022/04/placeholder.png")!)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 140, height: 100)
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(10)
                            .clipped()
                        
                        // Title
                        let parts = product.title.split(separator: "|")
                        Text(parts.count > 4 ? String(parts[1]) : product.title)
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.black)
                            .lineLimit(1)
                            .layoutPriority(1)
                            .frame(maxWidth: .infinity, alignment: .leading)

                        
                        // Type
                        Text(product.productType)
                            .font(.custom(Constants.AppFont.regularFont, size: 11))
                            .foregroundColor(.gray)
                            .padding(.horizontal, 5)
                        
                        // Price
                        if let firstVariant = product.variants.first {
                            let price = firstVariant.price.amount
                            Text(price.priceFormatter(with: currency))
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(.black)
                                .lineLimit(1)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        } else {
                            Text("No price")
                                .font(.system(size: 16))
                                .foregroundColor(.red)
                        }
                    }
                }
                .tint(.orange)
            }
            .padding()
            .frame(width: 170, height: 210) // reduced bottom space
            .background(Color.white)
            .cornerRadius(25)
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color.orange, lineWidth: 1.5)
            )
            
            // Top-right buttons
            HStack(spacing: 10) {
                if (self.isOutOfStock) {
                    Text("Out of Stock")
                              .font(.caption)
                              .fontWeight(.bold)
                              .padding(.horizontal, 8)
                              .padding(.vertical, 4)
                              .background(Color.red)
                              .foregroundColor(.white)
                              .cornerRadius(12)
                              .padding(10)
                } else {
                    // Add to Cart Button
                    Button(action: {
                        if let variantId = product.variants.first?.id {
                            cartViewModel.addProduct(productId: variantId, quantity: 1)
                            isAddedToCart = true
                            pressCount += 1
                            
                            // Reset icon after 2 seconds
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                isAddedToCart = false
                            }
                        } else {
                            print("No variant ID available to add to cart")
                        }
                    }) {
                        ZStack(alignment: .topTrailing) {
                            Image(systemName: isAddedToCart ? "checkmark.circle.fill" : "cart.badge.plus")
                                .foregroundColor(.white)
                                .padding(8)
                                .background(Color.orange.opacity(0.85))
                                .clipShape(Circle())
                            
                            // Counter Badge
                            if pressCount > 0 {
                                Text("\(pressCount)")
                                    .font(.caption2)
                                    .foregroundColor(.white)
                                    .padding(5)
                                    .background(Color.red)
                                    .clipShape(Circle())
                                    .offset(x: 10, y: -10)
                            }
                        }
                    }.padding(10)
                }
                    
            }
           
        } .onAppear {
            if let currentProductFromCart = cartViewModel.getFirstProductUnderVariants(variants: product.variants) {
                pressCount = currentProductFromCart.quantity
            }
            productViewModel.loadFavoriteStatus()
        }
    }
}
