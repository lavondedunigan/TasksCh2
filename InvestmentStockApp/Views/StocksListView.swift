import SwiftUI

struct StockItemCard: Identifiable {
    let id = UUID()
    var name: String
    var price: Double
}

struct StockCardListView: View {
    @State private var stockCards: [StockItemCard] = [
        StockItemCard(name: "Apple", price: 145.3),
        StockItemCard(name: "Google", price: 2729.3),
        StockItemCard(name: "Tesla", price: 709.4),
        StockItemCard(name: "Amazon", price: 3416.2),
        StockItemCard(name: "Facebook", price: 289.1),
        StockItemCard(name: "Alphabet", price: 305.2),
        StockItemCard(name: "SpaceX", price: 784.3),
        StockItemCard(name: "Microsoft", price: 298.1),
        StockItemCard(name: "NVIDIA", price: 120.3)
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(stockCards) { card in
                    StockCardView(card: card)
                }
            }
            .navigationTitle("Stocks")
            .bold()
            .onAppear(perform: addCard)
            .navigationBarItems(trailing: Button(action: addCard) {
                Image(systemName: "plus")
                    .font(.largeTitle)
                    .padding()
                    .accessibility(label: Text("Add New Stock"))
                    .accessibility(hint: Text("Tap to add a new stock to the list."))
            })
        }
    }
    
    private func addCard() {
        let newCard = StockItemCard(name: "New Stock", price: Double.random(in: 10...1000))
        stockCards.append(newCard)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.addCard()
        }
    }
}

struct StockCardView: View {
    let card: StockItemCard
    
    var body: some View {
        HStack {
            Text(card.name)
                .font(.headline)
            Spacer()
            Text(String(format: "$%.2f", card.price))
                .foregroundColor(.green)
        }
        .padding(.vertical, 8)
        .background(Color(.systemFill))
        .cornerRadius(8)
    }
}

struct StockCardListView_Previews: PreviewProvider {
    static var previews: some View {
        StockCardListView()
    }
}
