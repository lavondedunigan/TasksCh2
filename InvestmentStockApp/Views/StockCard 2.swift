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
            StockCard(ticker: "AAPL", companyName: "Apple Inc.", price: "$149.87", change: "+1.20%", logoURL: "https://logo.clearbit.com/apple.com")
            StockCard(ticker: "FB", companyName: "Meta Platforms Inc.", price: "$315.36", change: "+0.85%", logoURL: "https://logo.clearbit.com/facebook.com")
            StockCard(ticker: "AMZN", companyName: "Amazon.com, Inc.", price: "$341.00", change: "+1.50%", logoURL: "https://logo.clearbit.com/amazon.com")
            StockCard(ticker: "TSLA", companyName: "Tesla, Inc.", price: "$704.23", change: "+3.00%", logoURL: "https://logo.clearbit.com/tesla.com")
        }
        .padding()
    }
}
