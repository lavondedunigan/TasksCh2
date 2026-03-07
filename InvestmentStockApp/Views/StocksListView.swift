import SwiftUI

struct StockCard: Identifiable {
    let id = UUID()
    var name: String
    var price: Double
}

struct StockCardListView: View {
    @State private var stockCards: [StockCard] = [
        StockCard(name: "Apple", price: 145.3),
        StockCard(name: "Google", price: 2729.3),
        StockCard(name: "Tesla", price: 709.4)
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(stockCards) { card in
                    StockCardView(card: card)
                }
            }
            .navigationTitle("Stocks")
            .navigationBarItems(trailing: Button(action: addCard) {
                Image(systemName: "plus")
            })
        }
    }
    
    private func addCard() {
        let newCard = StockCard(name: "New Stock", price: Double.random(in: 10...1000))
        stockCards.append(newCard)
    }
}

struct StockCardView: View {
    let card: StockCard
    
    var body: some View {
        HStack {
            Text(card.name)
                .font(.headline)
            Spacer()
            Text(String(format: "$%.2f", card.price))
                .foregroundColor(.green)
        }
        .padding(.vertical, 8)
    }
}

struct StockCardListView_Previews: PreviewProvider {
    static var previews: some View {
        StockCardListView()
    }
}
