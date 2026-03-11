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
                    .lineLimit(1)
                    .fixedSize()
                    .truncationMode(.tail)
                    .padding(.bottom, 2)
                    .accessibility(identifier: "stock-name")
                    .accessibility(value: Text(name))
                    .accessibility(hint: Text("Tap to view more information"))
                .onTapGesture {
                    }
                Text(formattedPrice)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .font(Font.subheadline.weight(.semibold))
                    .lineLimit(1).fixedSize(horizontal: false, vertical: true)
                    .truncationMode(.tail)
                    .padding(.bottom, 2)
                    .accessibility(identifier: "stock-price")
                    .accessibility(value: Text(formattedPrice))
                    .accessibility(hint: Text("Tap to view more information"))
                    .onTapGesture {
                    }
            }
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .init(horizontal: .leading, vertical: .top))
        .background(
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(Color(.yellow))
                .shadow(color: Color.black.opacity(0.05), radius: 8, x: 0, y: 4)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .stroke(Color.primary.opacity(0.15))
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
        StockCard(name: "GOOGL", price: 2850.12)
        StockCard(name: "AMZN", price: 3410.00)
        StockCard(name: "FB", price: 300.78)
        StockCard(name: "NFLX", price: 245.32)
    }
    .padding()
    .background(Color(.systemGroupedBackground))
    
    
}
