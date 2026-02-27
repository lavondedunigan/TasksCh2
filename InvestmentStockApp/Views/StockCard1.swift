import SwiftUI

struct StockCard1: View {
    private func normalize(_ values: [CGFloat]) -> [CGFloat] {
        guard let min = values.min(), let max = values.max(), max > min else { return values }
        return values.map { ($0 - min) / (max - min) }
    }
    
    var body: some View {
        VStack(spacing: 12) {
            // Top row: Ticker + Company, Spacer, Change %
            HStack(alignment: .firstTextBaseline) {
                VStack(alignment: .leading, spacing: 2) {
                    Text("AAPL")
                        .font(.title3)
                        .bold()
                    Text("Apple Inc.")
                        .foregroundStyle(.gray)
                        .lineLimit(1)
                        .truncationMode(.tail)
                }

                Spacer()

                Text("1.2%")
                    .foregroundStyle(.green)
                    .bold()
                    .font(.title3)
            }

            // Middle row: Price and chart
            HStack(alignment: .center) {
                Text("$145.00")
                    .foregroundStyle(.green)
                    .bold()
                    .font(.title)

                Spacer()

                // If LineChart exists in the project, this will render; otherwise you can replace with a placeholder.
                LineChart(data: normalize(StockMockData.apple))
                    .stroke(Color.green, lineWidth: 2)
                    .frame(height: 60)
            }
        }
        .padding(.horizontal)
        .padding(.vertical)
        .padding(5)
        .frame(height: UIScreen.main.bounds.height / 4)
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 30)
                .stroke(Color.gray)
        )
    }
}

#Preview {
    StockCard()
}

