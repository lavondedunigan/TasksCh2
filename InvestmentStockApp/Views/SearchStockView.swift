import SwiftUI

struct SearchStockView: View {
    @State private var searchSymbol: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            TextField("Stock Ticker Symbol", text: $searchSymbol)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .stroke(Color.darkBlue, lineWidth: 1)
                )
                .padding()
                .textInputAutocapitalization(.never)
            
            Divider()
            
            StockCell(stock: "AAPL", description: "Apple Computers")
            Divider()
            StockCell(stock: "NETFLIX", description: "Channels")
            Divider()
            StockCell(stock: "TESLA", description: "Cars")
            Divider()
            StockCell(stock: "NIKE", description: "Jordans")
            Divider()
            StockCell(stock: "HPE", description: "Software")
            Divider()
            StockCell(stock: "DISNEY", description: "Entertainment")
            Divider()
            
            Spacer()
            
            NavigationLink(destination: SearchStockView()) {
                Text("Search Again")
                    .foregroundColor(.blue)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .stroke(style: StrokeStyle(lineWidth: 1, dash: [2]))
                    )
            }
            .padding()
            .background(
                Color.white
                    .shadow(
                        color: Color.black.opacity(0.2),
                        radius: 4,
                        x: 0,
                        y: 2
                    )
            )
        }
    }
}
struct SearchStockView_Previews: PreviewProvider {
    static var previews: some View {
        SearchStockView()
    }
}

