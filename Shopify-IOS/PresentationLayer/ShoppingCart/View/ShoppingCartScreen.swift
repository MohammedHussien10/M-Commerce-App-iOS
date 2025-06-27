import SwiftUI

struct ShoppingCartScreen: View {
    @EnvironmentObject var cartViewModel: CartViewModel
    @StateObject private var addressViewModel = AddressViewModel(
        useCase: AddressUseCase(
            repository: RepositoryImp(
                remoteDataSource: RemoteDataSource()
            )
        )
    )
    @Binding var isTabBarHidden: Bool
    
    @State private var showDeleteAlert = false
    @State private var productToDelete: CartProduct? = nil

    var body: some View {
        NavigationView {
            VStack {
                if cartViewModel.cartProducts.isEmpty {
                    VStack(spacing: 16) {
                        Image("out-of-stock")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                        Text("No Products Found")
                            .font(.headline)
                            .foregroundColor(.gray)
                    }
                } else {
                    List {
                        ForEach(cartViewModel.cartProducts) { product in
                            VStack(alignment: .leading, spacing: 8) {

                                CartProductRow(
                                    product: product,
                                    cartId: cartViewModel.cartId ?? "",
                                    onUpdateQuantity: { lineId, newQuantity in
                                        cartViewModel.updateProductQuantity(
                                            cartId: cartViewModel.cartId ?? "",
                                            lineId: lineId,
                                            newQuantity: newQuantity
                                        )
                                    },
                                    onRemove: { lineId in
                                        productToDelete = product
                                        showDeleteAlert = true
                                    }
                                )
                            }
                            .padding(.vertical, 4)
                        }
                    }
                    .listStyle(PlainListStyle())
                }
                
                NavigationLink(
                    destination: CheckoutScreen(
                        viewModel: CheckoutViewModel(
                            cartProducts: cartViewModel.cartProducts,
                            cartId: cartViewModel.cartId ?? ""
                        ),
                        addressViewModel: addressViewModel
                    )
                ) {
                    Text("Check Out")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            cartViewModel.shouldProceedCheckingOut
                            ? Constants.AppColor.primaryColor
                            : Color.gray.opacity(0.5)
                        )
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .padding(.horizontal)
                }
                .disabled(!cartViewModel.shouldProceedCheckingOut)
                .padding(.bottom, 16)
            }
            .onAppear {
                cartViewModel.loadCartProducts()
                isTabBarHidden = true
            }
            // ✅ Alert الحذف
            .alert(isPresented: $showDeleteAlert) {
                Alert(
                    title: Text("Delete Product"),
                    message: Text("Are you sure you want to delete \"\(productToDelete?.title ?? "this product")\" from your cart?"),
                    primaryButton: .destructive(Text("Delete")) {
                        if let lineId = productToDelete?.id {
                            cartViewModel.removeProduct(lineId: lineId)
                        }
                    },
                    secondaryButton: .cancel()
                )
            }
        }
    }
}
