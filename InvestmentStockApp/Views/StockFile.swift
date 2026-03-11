import SwiftUI

struct StockItem: Identifiable {
    let id = UUID()
    var ticker: String
    var companyName: String
    var price: String
    var change: String
    var logoURL: String
  
}

struct StocksListView: View {
    @State private var stocks: [StockItem] = [
        StockItem(ticker: "AAPL", companyName: "Apple Inc.", price: "$149.87", change: "+1.20%", logoURL: "https://logo.clearbit.com/apple.com"),
        StockItem(ticker: "MSFT", companyName: "Microsoft Corp.", price: "$402.11", change: "-0.42%", logoURL: "https://logo.clearbit.com/microsoft.com"),
        StockItem(ticker: "NVDA", companyName: "NVIDIA Corp.", price: "$785.22", change: "+2.10%", logoURL: "https://logo.clearbit.com/nvidia.com"),
        StockItem(ticker: "AMZN", companyName: "Amazon.com, Inc.", price: "$341.46", change: "+1.50%", logoURL: "https://logo.clearbit.com/amazon.com"),
        StockItem(ticker: "FB", companyName: "Meta Platforms, Inc.", price: "$325.45", change: "+0.60%", logoURL: "https://logo.clearbit.com/meta.com"),
        StockItem(ticker: "HPE", companyName: "HPE Corporation", price: "$30.00", change: "+0.90%", logoURL: "https://logo.clearbit.com/hpe.com"),
        StockItem(ticker: "WDC", companyName: "Western Digital Corporation", price: "$24.48", change: "+0.80%", logoURL: "https://logo.clearbit.com/westerndigital.com"),
        StockItem(ticker: "NTAP", companyName: "NetApp Inc.", price: "$17.49", change: "+1.00%", logoURL: "https://logo.clearbit.com/netapp.com"),
    ]

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(stocks) { stock in
                        StockRowCard(
                            ticker: stock.ticker,
                            companyName: stock.companyName,
                            price: stock.price,
                            change: stock.change,
                            logoURL: stock.logoURL
                            
                        )
                    }
                }
                .padding()
            }
            .navigationTitle("My Stocks")
            .onAppear {

            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        addRandomStock()
                    } label: {
                        Image(systemName: "plus")
                    }
                    .accessibilityLabel("Add stock")
                }
            }
        }
    }

    private func addRandomStock() {
        // Example: cycles through a few predefined stocks
        let candidates: [StockItem] = [
            StockItem(ticker: "AAPL", companyName: "Apple Inc.", price: "$149.87", change: "+1.20%", logoURL: "https://logo.clearbit.com/apple.com"),
            StockItem(ticker: "MSFT", companyName: "Microsoft Corp.", price: "$402.11", change: "-0.42%", logoURL: "https://logo.clearbit.com/microsoft.com"),
            StockItem(ticker: "AMZN", companyName: "Amazon.com, Inc.", price: "$341.00", change: "+1.50%", logoURL: "https://logo.clearbit.com/amazon.com"),
            StockItem(ticker: "TSLA", companyName: "Tesla, Inc.", price: "$704.23", change: "+3.00%", logoURL: "https://logo.clearbit.com/tesla.com"),
            StockItem(ticker: "META", companyName: "Meta Platforms, Inc.", price: "$315.36", change: "-0.85%", logoURL: "https://logo.clearbit.com/meta.com"),
            StockItem(ticker: "GOOGL", companyName: "Alphabet Inc.", price: "$145.22", change: "+0.65%", logoURL: "https://logo.clearbit.com/google.com")
        ]

        if let next = candidates.randomElement() {
            stocks.append(next)
        }
    }
}

struct StockRowCard: View {
    let ticker: String
    let companyName: String
    let price: String
    let change: String
    let logoURL: String

    var isGain: Bool {
        change.trimmingCharacters(in: .whitespaces).hasPrefix("+")
    }

    var body: some View {
        HStack(spacing: 12) {
            // Logo
            AsyncImage(url: URL(string: logoURL)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(width: 36, height: 36)
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 36, height: 36)
                        .clipShape(RoundedRectangle(cornerRadius: 6, style: .continuous))
                case .failure:
                    ZStack {
                        Color.gray.opacity(0.2)
                        Image(systemName: "building.2")
                            .foregroundStyle(.secondary)
                    }
                    .frame(width: 36, height: 36)
                    .clipShape(RoundedRectangle(cornerRadius: 6, style: .continuous))
                @unknown default:
                    EmptyView()
                }
            }

            // Texts
            VStack(alignment: .leading, spacing: 2) {
                HStack {
                    Text(ticker)
                        .font(.headline)
                    Spacer(minLength: 0)
                    Text(price)
                        .font(.headline)
                }
                HStack(spacing: 6) {
                    Text(companyName)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .lineLimit(1)
                    Spacer(minLength: 0)
                    Text(change)
                        .font(.subheadline.weight(.semibold))
                        .foregroundStyle(isGain ? .green : .red)
                }
            }
        }
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(.background)
                .shadow(color: .black.opacity(0.05), radius: 6, x: 0, y: 2)
        )
    }
}

#Preview("List of Stocks") {
    StocksListView()
}
#Preview("Single StockRowCard") {
    StockRowCard(
        ticker: "AAPL",
        companyName: "Apple Inc.",
        price: "$149.87",
        change: "+1.20%",
        logoURL: "https://logo.clearbit.com/apple.com"
    )
    .padding()
}

