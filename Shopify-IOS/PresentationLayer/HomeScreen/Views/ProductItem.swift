import SwiftUI
import Kingfisher

struct ProductItem: View {
    let product: Product
    @EnvironmentObject var cartViewModel: CartViewModel
    @StateObject private  var  productViewModel:ProductDetailsViewModel
    @StateObject private var  authViewModel:AuthViewModel
    @Binding var isTabBarHidden: Bool
    let currency = UserDefaults.standard.string(forKey: "selectedCurrency") ?? "USD"
    @State private var convertedPrice: String?
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
        _authViewModel = StateObject(wrappedValue: AuthViewModel())
     }

    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack(alignment: .leading, spacing: 6) {
                NavigationLink(destination: ProductDetailsView(viewModel: productViewModel,authViewModel: authViewModel, isTabBarHidden: $isTabBarHidden)) {
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
                        if let convertedPrice = convertedPrice {
                            Text(convertedPrice)
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
                }

                    
            }
           
        } .onAppear {
            //convert the Price
            if let price = product.variants.first?.price.amount{
                       ExchangeRateService.fetchExchangeRate(from: "USD", to: currency) { rate in
                           if let rate = rate {
                               let converted = price * rate
                               DispatchQueue.main.async {
                                   self.convertedPrice = converted.priceFormatter(with: currency)
                               }
                           }
                       }
             }
            
            
            if let currentProductFromCart = cartViewModel.getFirstProductUnderVariants(variants: product.variants) {
                pressCount = currentProductFromCart.quantity
            }
            productViewModel.loadFavoriteStatus()
        }
    }
}
