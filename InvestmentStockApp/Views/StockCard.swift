import SwiftUI

struct StockCard: View {
    let name: String
    let price: Double

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(name)
                    .font(.headline)
                    .bold()
                Text(formattedPrice)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            Spacer()
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(Color(.systemBackground))
                .shadow(color: Color.black.opacity(0.05), radius: 8, x: 0, y: 4)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .stroke(Color.secondary.opacity(0.15))
        )
        .padding(.horizontal)
    }

    private var formattedPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "USD"
        return formatter.string(from: NSNumber(value: price)) ?? "$0.00"
    }
}

#Preview {
    VStack(spacing: 12) {
        StockCard(name: "AAPL", price: 182.52)
        StockCard(name: "MSFT", price: 412.23)
    }
    .padding()
    .background(Color(.systemGroupedBackground))
}
