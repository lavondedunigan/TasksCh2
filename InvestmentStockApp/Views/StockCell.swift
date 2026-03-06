import SwiftUI

struct StockCell: View {
    let stock: String
    let description: String
    var body: some View {
        HStack {
            Text(stock)
                .font(.title3)
                .bold()
                .foregroundStyle(.blue)
            Spacer(minLength: 0)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .init(horizontal: .leading, vertical: .center))
            Text(description)
                .font(.caption)
                .foregroundStyle(.teal)
        }
        .padding()
        .background(Color(.systemBackground))
       
    }
}

struct StockCell_Previews: PreviewProvider {
    static var previews: some View {
        VStack(alignment: .leading, spacing: 0) {
            StockCell(stock: "AAPL", description: "Apple Inc.")
            StockCell(stock: "MSFT", description: "Microsoft Corporation")
            StockCell(stock: "AMZN", description: "Amazon.com, Inc.")
            StockCell(stock: "GOOGL", description: "Alphabet Inc.")
            StockCell(stock: "META", description: "Meta Platforms, Inc.")
            StockCell(stock: "NFLX", description: "Netflix, Inc.")
        }
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
