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
                        .foregroundStyle(.black)
                        .bold()
                        .padding()
                        .shadow(radius: 5).padding(10)
                        .background(Color(.systemGreen))
                        .cornerRadius(8)
                        .padding(.horizontal, 20)
                        .padding(.bottom, 10)
                        .padding(.top, 10)
                        
                    
                    Text(investment.title)
                        .font(.headline)
                        .foregroundStyle(.black)
                        .padding()
                        .shadow(radius: 5)
                        .padding(.horizontal, 20)
                        .padding(.top, 20)
                        .padding(.bottom, 10)
                    
                    Text("Stock Symbol:")
                        .font(.subheadline)
                        .foregroundStyle(.black)
                        .padding()
                        .shadow(radius: 5)
                        .padding(.horizontal, 20)
                        .padding(.top, 20)
                        .padding(.bottom, 10)
                        .background(Color(.systemBlue))
                        .padding(10)
                        .cornerRadius(8)
                        .padding()
                    
                    Text(investment.stock)
                        .font(.subheadline)
                        .foregroundStyle(.black)
                        .padding(10)
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(8)
                        .padding()
                        .shadow(radius: 5)
                        .padding(.horizontal, 20)
                        .background(Color(.systemCyan))
                        .cornerRadius(8)
                        .padding(.top, 20)
                    
                    Text("Current Price:")
                        .font(.subheadline)
                        .foregroundStyle(.black)
                        .padding(10)
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(8)
                        .padding()
                        .shadow(radius: 5)
                        .padding(.horizontal, 20)
                        .padding(.top, 20)
                        .padding(.bottom, 10)
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(8)
                    
                    
                    HStack {
                        Text(investment.stockPrice, format: .currency(code: "USD"))
                            .font(.headline)
                            .foregroundStyle(.white)
                            .padding()
                            .background(Color.gray)
                            .cornerRadius(8)
                            .frame(maxWidth: .infinity, alignment: .center)

                        Spacer()
                    }
                    
                    Text("Shares:")
                        .font(.subheadline)
                        .foregroundStyle(.black)
                        .padding(10)
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(8)
                        .padding()
                        .shadow(radius: 5)
                        .padding(.horizontal, 20)
                        .padding(.top, 20)
                        .padding(.bottom, 10)
                        .background(Color(.secondarySystemBackground))
                    
                    Text("\(investment.shares)")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .center)
                        .background(Color.gray)
                        .cornerRadius(8)
                        .padding(.top, 20)
                }
            }
        }
    }
}

#Preview {
    let work = Category(name: "Work", colorHex: "#b36827")
    
    let inv1 = Investment(title: "Netflix", stock: "ntf", stockPrice: 200.0, ammount: 2000, shares: 10, category: work)
    let inv2 = Investment(title: "Apple", stock: "aapl", stockPrice: 150.0, ammount: 3000, shares: 20, category: work)
    let inv3 = Investment(title: "Amazon", stock: "amzn", stockPrice: 300.0, ammount: 5000, shares: 30, category: work)
    let inv4 = Investment(title: "Tesla", stock: "tsla", stockPrice: 400.0, ammount: 4000, shares: 25, category: work)
    let inv5 = Investment(title: "Alphabet", stock: "goog", stockPrice: 600.0, ammount: 6000, shares: 20, category: work)
    let inv6 = Investment(title: "Twitter", stock: "twtr", stockPrice: 700.0, ammount: 7000, shares: 10, category: work)
    
    
    InvestmentDetailsView(investment: inv1)
}

