
//
//  CheckoutScreen.swift
//  Shopify-IOS
//
//  Created by Noha Ali Gomaa on 23/06/2025.
//

import SwiftUI
import PassKit

struct CheckoutScreen: View {
    @Environment(\.dismiss) private var dismiss
    @State private var discountCode = ""
    
    @State private var selectedPaymentMethod: String? = nil
    @State private var discountApplied = false
    @State private var promoError: String?
    @State private var showAlert = false
    @State private var alertMessage = ""
    @EnvironmentObject private var cartViewModel: CartViewModel
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
                    checkoutButton()
                    VStack(spacing: 16) {
                        applePayButton
                        placeOrderButton()
                    }
                    .padding(.horizontal)
                }
                .padding(.vertical)
                .background(Color.forBackground)
                .task {
                    viewModel.isLoading = true
                    await viewModel.getAddresses(accessToken: token)
                    
                    if let defaultAddress = viewModel.addresses.first(where: { $0.isDefault }) {
                        viewModel.selectedAddress = defaultAddress
                    } else {
                        viewModel.selectedAddress = viewModel.addresses.first
                    }

                    await viewModel.createDraftOrder()
                    viewModel.isLoading = false
                }

                .onAppear {
                    viewModel.fetchExchangeRate()
                    cartViewModel.fetchExchangeRate()
                    configureScreen() // Make this synchronous
                }
            }
            .loadingWithBlur(isLoading: $viewModel.isLoading)
            .navigationTitle("Check Out")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    backButton()
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
}

// MARK: - Sections

private extension CheckoutScreen {
    func shippingAddressSection() -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Shipping Address")
                .font(.title2).bold().padding(.horizontal)
                .foregroundColor(.forText)
            if viewModel.addresses.isEmpty {
                Text("No Address Found")
                    .foregroundColor(.forText)
                    .padding(.horizontal)
            } else {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 8) {
                        ForEach(viewModel.addresses) { address in
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
                .foregroundColor(.forText)
            if viewModel.cartProducts.isEmpty {
                emptyCartView()
            } else {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(viewModel.cartProducts, id: \.id) { product in
                            CartProducts(product: product,exchangeRate:cartViewModel.exchangeRate,currency: UserDefaults.standard.string(forKey: "selectedCurrency") ?? "USD")
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
                .foregroundColor(.forText)
            HStack {
                TextField("Enter promo code", text: $discountCode)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.allCharacters)
                    .disabled(discountApplied) // Disable when applied
                    .opacity(discountApplied ? 0.5 : 1.0)

                if discountApplied {
                    Button("Clear") {
                        Task {
                          await  viewModel.updateDraftOrder(discountCode: nil, address: nil) {result in }
                            discountApplied = false
                            discountCode = ""
                            promoError = nil
                            viewModel.originalSubtotalRaw = 0.0
                        }
                    }
                    .buttonStyle(PrimaryButtonStyle())
                } else {
                    Button("Apply") {
                        if discountCode.isEmpty {
                            promoError = "Please enter a valid promo code."
                        } else {
                            Task {
                                await viewModel.updateDraftOrder(discountCode: discountCode, address: viewModel.selectedAddress) { success in
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
        VStack(alignment: .leading, spacing: 12) {
            let currency = UserDefaults.standard.string(forKey: "selectedCurrency") ?? "USD"
            let subtotal = viewModel.originalSubtotalRaw * viewModel.exchangeRate
            let taxes = viewModel.taxesRaw * viewModel.exchangeRate
            let discountedSubtotal = viewModel.discountedSubtotalRaw * viewModel.exchangeRate
            let total = discountedSubtotal + taxes
            let discountValue = subtotal - discountedSubtotal
            
            // Subtotal
            HStack {
                Text("Original Subtotal:")
                    .font(.callout).bold()
                Spacer()
                Text(subtotal.priceFormatter(with: currency))
                   .font(.subheadline).bold()
                   .foregroundColor(.forText)
                   .strikethrough(discountApplied)
            }
     
                    if discountApplied && discountValue > 0 {
                        HStack {
                            Text("Discount:")
                                .font(.callout).bold()
                            Spacer()
                            Text("-" + discountValue.priceFormatter(with: currency))
                                .font(.subheadline).bold()
                                .foregroundColor(.red)
                        }
                    }
          
                    if discountApplied {
                        HStack {
                            Text("Discounted Subtotal:")
                                .font(.callout).bold()
                            Spacer()
                            Text(discountedSubtotal.priceFormatter(with: currency))
                                .font(.subheadline).bold()
                                .foregroundColor(.green)
                        }
                    }
         
                    if taxes > 0 {
                        HStack {
                            Text("Taxes:")
                                .font(.callout).bold()
                            Spacer()
                            Text(taxes.priceFormatter(with: currency))
                                .font(.subheadline).bold()
                                .foregroundColor(.orange)
                        }
                    }
  
                    HStack {
                        Text("Total with Taxes:")
                            .font(.title3).bold()
                        Spacer()
                        Text(total.priceFormatter(with: currency))
                            .font(.title3).bold()
                            .foregroundColor(.orange)
                    }
                }
                .padding(.horizontal)
    }


    func placeOrderButton() -> some View {
        Button("Cash On Delivery") {
            UserDefaults.standard.removeObject(forKey: "CartID")
            Task {
              await viewModel.completeDraftOrder { isSuccess in
                    if isSuccess {
                        Task {
                            await cartViewModel.completeOrder()
                            DispatchQueue.main.async {
                                dismiss()
                            }
                        }
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
        // 👇 Alert modifier for displaying failure message
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Error"),
                message: Text(alertMessage),
                dismissButton: .default(Text("OK"))
            )
        }
    }
    
}

// MARK: - Components

private extension CheckoutScreen {
    func paymentMethodButton(title: String) -> some View {
        Button {
            selectedPaymentMethod = title
        } label: {
            Text(title)
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 12)
                .background(selectedPaymentMethod == title ? .orange : Color.forText.opacity(0.3))
                .foregroundColor(.white)
                .cornerRadius(12)
        }
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
        appearance.titleTextAttributes = [.foregroundColor: UIColor.orange, .font: UIFont.boldSystemFont(ofSize: 20)]
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
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

extension CheckoutScreen {
    var applePayButton: some View {
        VStack {
            if PKPaymentAuthorizationViewController.canMakePayments() {
                ApplePayButtonWrapper {
                    startApplePay()
                }
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .padding(.horizontal)
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
                            Task {
                                await cartViewModel.completeOrder()
                                DispatchQueue.main.async {
                                   dismiss()
                                }
                            }
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

// MARK: - Styles

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

struct ApplePayButtonWrapper: UIViewRepresentable {
    let action: () -> Void

    func makeUIView(context: Context) -> PKPaymentButton {
        let button = PKPaymentButton(paymentButtonType: .buy, paymentButtonStyle: .black)
        button.cornerRadius = 12
        button.addTarget(context.coordinator, action: #selector(Coordinator.didTap), for: .touchUpInside)
        return button
    }

    func updateUIView(_ uiView: PKPaymentButton, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(action: action)
    }

    class Coordinator {
        let action: () -> Void

        init(action: @escaping () -> Void) {
            self.action = action
        }

        @objc func didTap() {
            action()
        }
    }
}


