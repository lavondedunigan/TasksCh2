import SwiftUI
import SwiftData

struct InvestmentDetailsView: View {
    let investment: Investment

    var body: some View {
        NavigationStack {
            ZStack {
                Backgrounds.gradient3
                    .ignoresSafeArea()

                ScrollView { // Use ScrollView in case content grows
                    VStack(alignment: .leading, spacing: 12) {
                        LabeledPill(title: "Stock Title:")
                        ValuePill(text: investment.title)

                        LabeledPill(title: "Stock Symbol:")
                        ValuePill(text: investment.stock)

                        LabeledPill(title: "Current Price:")
                        HStack {
                            ValuePill(text: investment.stockPrice, isCurrency: true)
                            Spacer()
                        }

                        LabeledPill(title: "Shares:")
                        ValuePill(text: String(investment.shares))
                    }
                    .padding(16)
                }
            }
            .navigationTitle("Investment Details")
        }
    }
}

private struct LabeledPill: View {
    let title: String

    var body: some View {
        Text(title)
            .font(.subheadline)
            .foregroundStyle(.black)
            .bold()
            .padding(8)
            .background(Color.teal)
            .cornerRadius(8)
            .shadow(radius: 5)
    }
}

private struct ValuePill: View {
    let text: String

    init(text: String) {
        self.text = text
    }

    init(text: Double, isCurrency: Bool) {
        if isCurrency {
            self.text = text.formatted(.currency(code: "USD"))
        } else {
            self.text = String(text)
        }
    }

    init(text: Decimal, isCurrency: Bool) {
        if isCurrency {
            // Convert Decimal to NSDecimalNumber for formatting without precision loss
            let number = NSDecimalNumber(decimal: text)
            let formatter = NumberFormatter()
            formatter.numberStyle = .currency
            formatter.currencyCode = "USD"
            self.text = formatter.string(from: number) ?? number.stringValue
        } else {
            self.text = NSDecimalNumber(decimal: text).stringValue
        }
    }

    var body: some View {
        Text(text)
            .font(.subheadline)
            .foregroundStyle(.black)
            .bold()
            .padding(8)
            .background(Color.blue)
            .cornerRadius(8)
            .shadow(radius: 5)
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

    return InvestmentDetailsView(investment: inv1)
}

