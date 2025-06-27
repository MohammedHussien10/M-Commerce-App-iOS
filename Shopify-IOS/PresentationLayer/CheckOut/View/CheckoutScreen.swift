import SwiftUI
import PassKit

struct CheckoutScreen: View {
    @Environment(\.dismiss) private var dismiss
    @State private var discountCode = ""
    @State private var discountApplied = false
    @State private var promoError: String?
    @State private var showAlert = false
    @State private var alertMessage = ""
    @ObservedObject private var viewModel: CheckoutViewModel

    @ObservedObject private var addressViewModel: AddressViewModel
    let token = SessionManager.shared.accessToken
    let paymentHandler = PaymentHandler()

    init(viewModel: CheckoutViewModel, addressViewModel: AddressViewModel) {
           self.viewModel = viewModel
           self.addressViewModel = addressViewModel
       }

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    shippingAddressSection()
                    cartItemsSection()
                    discountSection()
                    totalPriceSection()
                    paymentMethodSection()
                    placeOrderButton()
                    checkoutButton()
                }
                .padding(.vertical)
                .onAppear {
                    configureScreen()
                    Task {
                        await viewModel.createDraftOrder()
                        addressViewModel.getAddresses(accessToken: token)
                    }
                }

            }
            .navigationBarTitleDisplayMode(.inline)
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Error"),
                    message: Text(alertMessage),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
    }
}

extension CheckoutScreen {
    var applePayButton: some View {
        VStack {
            if PKPaymentAuthorizationViewController.canMakePayments() {
                PayWithApplePayButton {
                    startApplePay()
                }
                .frame(height: 50)
                .padding()
            } else {
                Text("Apple Pay is not available.")
                    .foregroundColor(.red)
            }
        }
    }

    func startApplePay() {
        var paymentItems: [PKPaymentSummaryItem] = viewModel.cartProducts.map { product in
            PKPaymentSummaryItem(
                label: product.title,
                amount: NSDecimalNumber(value: product.price * Double(product.quantity))
            )
        }

        paymentItems.append(
            PKPaymentSummaryItem(
                label: "Total",
                amount: NSDecimalNumber(
                    string: viewModel.totalPrice.filter("0123456789.".contains)
                )
            )
        )

        paymentHandler.startPayment(items: paymentItems) { success, data in
            if success {
                print("Apple Pay Payment Success")
                Task {
                    await viewModel.completeDraftOrder { isSuccess in
                        if isSuccess {
                            dismiss()
                        } else {
                            alertMessage = "Order could not be completed. Please try again."
                            showAlert = true
                        }
                    }
                }
            } else {
                print("Apple Pay Payment Failed")
            }
        }
    }
}


// MARK: - Sections

private extension CheckoutScreen {
    func shippingAddressSection() -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Shipping Address")
                .font(.title2).bold().padding(.horizontal)

            if addressViewModel.addresses.isEmpty {
                Text("No Address Found")
                    .foregroundColor(.gray)
                    .padding(.horizontal)
            } else {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 8) {
                        ForEach(addressViewModel.addresses) { address in
                            AddressCell(address: address)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(
                                            viewModel.selectedAddress?.id == address.id ? Color.orange : Color.clear,
                                            lineWidth: 3
                                        )
                                )
                                .onTapGesture {
                                    viewModel.selectedAddress = address
                                }
                        }

                    }
                    .padding(.horizontal)
                }
            }
        }
    }


    func cartItemsSection() -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Cart Items").font(.title2).bold().padding(.horizontal)

            if viewModel.cartProducts.isEmpty {
                emptyCartView()
            } else {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(viewModel.cartProducts, id: \.id) { product in
                            CartProducts(product: product)
                                .frame(height: 250)
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
    }

    func discountSection() -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Promo Code")
                .font(.title3)
                .bold()
                .padding(.horizontal)

            HStack {
                TextField("Enter promo code", text: $discountCode)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.allCharacters)
                    .disabled(discountApplied)
                    .opacity(discountApplied ? 0.5 : 1.0)

                if discountApplied {
                    Button("Clear") {
                        Task {
                            await viewModel.updateDraftOrder(discountCode: nil, address: nil) { _ in }
                            discountApplied = false
                            discountCode = ""
                            promoError = nil
                        }
                    }
                    .buttonStyle(PrimaryButtonStyle())
                } else {
                    Button("Apply") {
                        if discountCode.isEmpty {
                            promoError = "Please enter a valid promo code."
                        } else {
                            Task {
                                await viewModel.updateDraftOrder(discountCode: discountCode, address: nil) { success in
                                    if success {
                                        discountApplied = true
                                        promoError = nil
                                    } else {
                                        promoError = "Promo code not applied. Please try again."
                                    }
                                }
                            }
                        }
                    }
                    .buttonStyle(PrimaryButtonStyle())
                }
            }
            .padding(.horizontal)

            if discountApplied {
                Text("Discount Applied!")
                    .font(.caption)
                    .foregroundColor(.green)
                    .padding(.horizontal)
            }

            if let error = promoError {
                Text(error)
                    .font(.caption)
                    .foregroundColor(.red)
                    .padding(.horizontal)
            }
        }
    }

    func totalPriceSection() -> some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("Total Price:")
                    .font(.title2).bold()
                Spacer()
                Text(viewModel.totalPrice)
                    .font(.title2).bold()
                    .foregroundColor(.orange)
            }
            .padding(.horizontal)

            if discountApplied {
                Text("Discounted Price: \(viewModel.subtotalPrice)")
                    .font(.body)
                    .foregroundColor(.green)
                    .padding(.horizontal)
            }
        }
    }

    func paymentMethodSection() -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Choose Payment Method")
                .font(.title3).bold()
                .padding(.horizontal)

            HStack(spacing: 16) {
                applePayButton
            }
            .padding(.horizontal)
        }
    }

    func placeOrderButton() -> some View {
        Button("Place Order") {
            Task {
                await viewModel.completeDraftOrder { isSuccess in
                    if isSuccess {
                        dismiss()
                    } else {
                        alertMessage = "Order could not be completed. Please try again."
                        showAlert = true
                    }
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Constants.AppColor.primaryColor)
        .foregroundColor(.white)
        .cornerRadius(12)
        .padding(.horizontal)
        .padding(.top, 8)
    }
}


// MARK: - Components

private extension CheckoutScreen {
    func emptyCartView() -> some View {
        VStack(spacing: 16) {
            Image("out-of-stock")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
            Text("No Products Found")
                .font(.headline)
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 30)
    }

    func backButton() -> some View {
        Button {
            Task {
                await viewModel.deleteDraftOrder {
                    dismiss()
                }
            }
        } label: {
            Image(systemName: "chevron.left")
                .foregroundColor(.orange)
                .font(.system(size: 18, weight: .bold))
        }
    }

    func configureScreen() {
        let appearance = UINavigationBarAppearance()
        appearance.titleTextAttributes = [
            .foregroundColor: UIColor.orange,
            .font: UIFont.boldSystemFont(ofSize: 20)
        ]
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }

    func checkoutButton() -> some View {
        Group {
            if let checkoutURL = viewModel.checkoutURL {
                Link(destination: checkoutURL) {
                    Text("Proceed to Checkout")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                .padding(.horizontal)
            }
        }
    }
}

// MARK: - Button Style

struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal)
            .padding(.vertical, 8)
            .background(Constants.AppColor.primaryColor)
            .foregroundColor(.white)
            .cornerRadius(8)
    }
}
