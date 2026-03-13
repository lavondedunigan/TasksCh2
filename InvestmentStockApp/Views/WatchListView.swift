import SwiftUI

struct WatchListView: View {
    var body: some View {
        VStack(spacing: 0) {
            // Header section
            VStack(spacing: 16) {
                Text("Watch List")
                    .font(.title)
                    .bold()
                    .padding()
                    .background(Color(.systemTeal))
                    .cornerRadius(10)
                    .shadow(radius: 10)
            }
            .padding(.horizontal)
            .padding(.top, 15)
            .padding(.bottom, 10)

            // Add new goal button/row
            Text("Add a new goal")
                .font(.title)
                .bold()
                .padding()
                .background(Color.teal)
                .cornerRadius(10)
                .shadow(radius: 10)
                .padding(.horizontal)
                .padding(.top, 5)
                .padding(.bottom, 10)
                .onTapGesture {
                    print("tapping Add a new goal")
                }

            // Stock cards list
            ScrollView {
                VStack {
                    StockCard(name: "AAPL", price: 182.52)
                    StockCard(name: "MSFT", price: 412.23)
                    StockCard(name: "GOOGL", price: 142.87)
                    StockCard(name: "AMZN", price: 176.45)
                    StockCard(name: "META", price: 488.30)
                    StockCard(name: "TSLA", price: 188.12)
                    StockCard(name: "NVDA", price: 822.79)
                    StockCard(name: "NFLX", price: 607.15)
                }
                .padding(3)
            }
        }
    }
}

struct WatchListView_Previews: PreviewProvider {
    static var previews: some View {
        WatchListView()
    }
}

