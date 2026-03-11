import SwiftUI

struct StockCell: View {
    let stock: String
    let description: String

    var body: some View {
        HStack {
            Text(stock)
                .font(.title2)
                .bold()
                .foregroundStyle(.blue)
            Spacer(minLength: 0)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .init(horizontal: .leading, vertical: .center))
            Text(description)
                .font(.caption)
                .foregroundStyle(.black)
                .lineLimit(1)
                .fixedSize()
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .init(horizontal: .leading, vertical: .center))
                .clipped()
                .padding(.trailing, 10)
                
        }
        .padding()
        .background(Color(.systemBackground) .opacity(0.05))
        .cornerRadius(8)
        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 0)
        .padding(10)
        .clipped()
        
        }
       
    }


struct StockCell_Previews: PreviewProvider {
    struct PreviewWrapper: View {
        @State private var showingAddStockAlert = false
        var body: some View {
            NavigationView {
                VStack(alignment: .leading, spacing: 0) {
                    StockCell(stock: "AAPL", description: "Apple Inc.")
                    StockCell(stock: "MSFT", description: "Microsoft Corporation")
                    StockCell(stock: "AMZN", description: "Amazon.com, Inc.")
                    StockCell(stock: "GOOGL", description: "Alphabet Inc.")
                    StockCell(stock: "META", description: "Meta Platforms, Inc.")
                    StockCell(stock: "NFLX", description: "Netflix, Inc.")
                    StockCell(stock: "FB", description: "Meta Platforms, Inc.")
                    StockCell(stock: "TSLA", description: "Tesla, Inc.")
                    StockCell(stock: "HPE", description: "Hewlett Packard Enterprise Company")
                }
                .navigationTitle("Stocks")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Add Stock") {
                            showingAddStockAlert = true
                        }
                    }
                }
                .alert("Add Stock", isPresented: $showingAddStockAlert) {
                    Button("OK", role: .cancel) { }
                }
                .padding()
                .background(Color(.secondarySystemBackground))
                .navigationTitle(Text("Stocks"))
                .navigationBarTitleDisplayMode(.inline)
                
            
            }
            .navigationViewStyle(.stack)
        }
    }

    static var previews: some View {
        PreviewWrapper()
            .previewLayout(.sizeThatFits)
    }
}
