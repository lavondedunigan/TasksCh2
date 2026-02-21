import SwiftUI
import SwiftData

struct InvestmentDetailsView: View {
    let investment: Investment
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                Backgrounds.gradient3.ignoresSafeArea()
                
                VStack {
                    Text("Stock Title:")
                        .font(.subheadline)
                        .foregroundStyle(.teal)
                    
                    Text(investment.title)
                        .font(.headline)
                        .foregroundStyle(.white)
                        .padding()
                }
            }
        }
    }
}

#Preview {
    let work = Category(name: "Work", colorHex: "#b36827")
    let inv1 = Investment(title: "Netflix", stock: "ntf", stockPrice: 200.0, ammount: 2000, shares: 10, category: work)
    let inv2 = Investment(title: "Apple", stock: "aapl", stockPrice: 150.0, ammount: 3000, shares: 20, category: work)
    let inv4 = Investment(title: "Amazon", stock: "amzn", stockPrice: 300.0, ammount: 5000, shares: 30, category: work)
    let inv5 = Investment(title: "Tesla", stock: "tsla", stockPrice: 400.0, ammount: 4000, shares: 25, category: work)
    let inv6 = Investment(title: "Alphabet", stock: "goog", stockPrice: 600.0, ammount: 6000, shares: 20, category: work)
    
    
    InvestmentDetailsView(investment: inv1)
}
