import SwiftUI

struct BrandItem: View {
    let collection: CollectionModel

    var body: some View {
        VStack(alignment: .center, spacing: 6) {
            KingFisherImageView(
                url: collection.imageUrl ?? "https://theperfectroundgolf.com/wp-content/uploads/2022/04/placeholder.png",
                placeholder: ""
            )
            .resizable()
            .scaledToFit()
            .frame(width: UIScreen.main.bounds.width * 0.15,
                   height: UIScreen.main.bounds.width * 0.15,
                   alignment: .center)
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(Color.orange, lineWidth: 2) // 🟠 Orange stroke
            )

            Text(collection.title.uppercased())
                .fontWeight(.light)
                .foregroundColor(Color.forText)

            Spacer()
        }
        .padding(8)
           .background(Color.forBackground)
           .cornerRadius(12)
    }
}
