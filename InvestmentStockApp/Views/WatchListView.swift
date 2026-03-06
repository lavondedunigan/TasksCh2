import SwiftUI

struct WatchListView: View {
    var body: some View {
        VStack {
            HStack {
                
            }
            Text("Watch List")
                .font(.title)
                .bold()
                
            
            Spacer()
            
            
            Text("Add a new goal")
                .font(.title2)
                .bold()
                .font(.caption)
            
            
            
            Spacer()
        }
        // stock cards
        ScrollView {
            VStack {
    
                StockCard(ticker: "AAPL")
                StockCard(ticker: "MSFT")
                StockCard(ticker: "GOOGL")
                StockCard(ticker: "AMZN")
                StockCard(ticker: "META")
                StockCard(ticker: "TSLA")
                StockCard(ticker: "NVDA")
                StockCard(ticker: "NFLX")
                
            }
        }
        .padding(3)
    }
    
    
    struct WatchListView_Previews: PreviewProvider {
        static var previews: some View {
            WatchListView()
        }
    }
}
