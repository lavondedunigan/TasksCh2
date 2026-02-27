import SwiftUI

struct StockCard: View {
    var ticker: String = "AAPL"
    var companyName: String = "Apple Inc."
    var price: String = "$168.45"
    var change: String = "+1.23%"
    var logoURL: String = "https://logo.clearbit.com/apple.com"

    var body: some View {
        HStack(spacing: 16) {
            AsyncImage(url: URL(string: logoURL)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(width: 50, height: 50)
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                case .failure:
                    Image(systemName: "chart.line.uptrend.xyaxis")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .foregroundStyle(.blue)
                @unknown default:
                    EmptyView()
                }
            }

            VStack(alignment: .leading, spacing: 4) {
                Text(ticker)
                    .font(.headline)
                    .bold()
                Text(companyName)
                    .font(.subheadline)
                    .foregroundStyle(Color.gray)
                    .lineLimit(1)
                    .truncationMode(.tail)
            }

            Spacer()

            VStack(alignment: .trailing, spacing: 4) {
                Text(price)
                    .font(.headline)
                Text(change)
                    .font(.subheadline)
                    .bold()
                    .foregroundStyle(change.hasPrefix("-") ? .red : .green)
            }
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 16).fill(Color(.systemGray6)))
        .shadow(color: Color.black.opacity(0.1), radius: 6, x: 0, y: 2)
    }
}

#Preview {
    ScrollView {
        VStack(spacing: 12) {
            StockCard()
            StockCard(ticker: "MSFT", companyName: "Microsoft Corp.", price: "$402.11", change: "-0.42%", logoURL: "https://logo.clearbit.com/microsoft.com")
            StockCard(ticker: "NVDA", companyName: "NVIDIA Corp.", price: "$785.22", change: "+2.10%", logoURL: "https://logo.clearbit.com/nvidia.com")
        }
        .padding()
    }
}
