import SwiftUI
import Kingfisher

struct ProductItem: View {
    let product: Product
    @EnvironmentObject var cartViewModel: CartViewModel
    @Binding var isTabBarHidden: Bool
    let currency = UserDefaults.standard.string(forKey: "selectedCurrency") ?? "USD"
    
    @State private var isFavorited = false
    @State private var isAddedToCart = false
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack(alignment: .leading, spacing: 6) {
                NavigationLink(destination: ProductDetailsView(viewModel: ProductDetailsViewModel(product: product), isTabBarHidden: $isTabBarHidden)) {
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
                // Favorite Button
                Button(action: {
                    isFavorited.toggle()
                }) {
                    Image(systemName: isFavorited ? "heart.fill" : "heart")
                        .foregroundColor(.white)
                        .padding(8)
                        .background(Color.orange.opacity(0.85))
                        .clipShape(Circle())
                }

                // Add to Cart Button
                Button(action: {
                    if let variantId = product.variants.first?.id {
                        cartViewModel.addProduct(productId: variantId, quantity: 1)
                        isAddedToCart = true
                        // Optional: Reset back to original icon after 2 seconds
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            isAddedToCart = false
                        }
                    } else {
                        print("No variant ID available to add to cart")
                    }
                }) {
                    Image(systemName: isAddedToCart ? "checkmark.circle.fill" : "cart.badge.plus")
                        .foregroundColor(.white)
                        .padding(8)
                        .background(Color.orange.opacity(0.85))
                        .clipShape(Circle())
                }
            }
            .padding(10)
        }
    }
}
