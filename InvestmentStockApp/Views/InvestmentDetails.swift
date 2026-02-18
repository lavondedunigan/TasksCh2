import SwiftUI
import SwiftData

struct InvestmentDetailsView: View {
    let investment: Investment
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                Backgrounds.gradient3.ignoresSafeArea()
                
                VStack {
                    Text("Task Title:")
                        .font(.subheadline)
                        .foregroundStyle(.white)
                    
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
    InvestmentDetailsView(investment: inv1)
}
