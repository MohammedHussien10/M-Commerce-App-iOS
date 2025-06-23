import SwiftUI
import Kingfisher

struct CartProducts: View {
    let product: CartProduct

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            // Product Image
            AsyncImage(url: URL(string: product.imageURL)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Color.gray.opacity(0.3)
            }
            .frame(width: 120, height: 120)
            .cornerRadius(12)
            .clipped()
            .frame(maxWidth: .infinity, alignment: .center)
            Divider()
            // Product Info
            VStack(alignment: .center, spacing: 4) {
                let parts = product.title.split(separator: "|")
                Text(parts.count > 1 ? String(parts[1]) : product.title)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.black)
                    .lineLimit(1)
                Divider()
                HStack {
                    Text("Quantity:")
                        .font(.custom(Constants.AppFont.regularFont, size: 13))
                        .foregroundColor(.black)
                        .padding(.horizontal)
                    
                    Text("\(product.quantity)")
                        .font(.custom(Constants.AppFont.regularFont, size: 14))
                        .foregroundColor(.black)
                        .bold()
                }
                Divider()
                HStack {
                    Text("Price:")
                        .font(.custom(Constants.AppFont.regularFont, size: 13))
                        .foregroundColor(.black)
                        .padding(.horizontal)
                  
                    Text(String(format: "%.1f", product.price)) // ✅ Show price as 23.0
                        .font(.custom(Constants.AppFont.regularFont, size: 14))
                        .foregroundColor(.black)
                        .bold()
                }
            }
        }
        .padding()
        .frame(width: 180, height: 230)
        .background(Color.white)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.orange, lineWidth: 1.2)
        )
    }
}
