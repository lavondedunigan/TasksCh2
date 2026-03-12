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
                    .fixedSize()
                    .accessibility(identifier: "stock-price")
                    .accessibility(value: Text(formattedPrice))
                    .accessibility(hint: Text("Tap to view more information"))
                    .onTapGesture {
                    }
                    .font(.subheadline)
                    .foregroundStyle(.red)
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
                .stroke(Color(.black).opacity(0.1), lineWidth: 1)
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
        StockCard(name: "BABA", price: 150.23)
        StockCard(name: "TSLA", price: 700.00)
    }
    .font(.caption)
    .padding(8)
    .background(Color(.systemGreen))
    .padding()
    .background(Color(.systemBlue))
    .padding(16)
    .frame(maxWidth: .infinity)
    
    
    
}
