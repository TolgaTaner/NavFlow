import SwiftUI

struct ProductDetailView: View {
    let product: Product

    var body: some View {
        VStack(spacing: 16) {
            Text(product.name)
                .font(.title)
            Text(String(format: "$%.2f", product.price))
                .font(.title2)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(white: 0.95))
    }
}


