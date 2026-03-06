import SwiftUI

struct ContentView: View {
    @State private var isShowingStockSearchSheet: Bool = false
    @State private var goToHomeViewIphone: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                // Header
                HeaderView(showSheet: $isShowingStockSearchSheet)
                
                // Navigation button to HomeView_iPhone
                HStack {
                    Button {
                        goToHomeViewIphone = true
                    } label: {
                        Image(systemName: "house.fill")
                            .font(.system(size: 30))
                            .foregroundStyle(Color.darkBlue)
                          
                    }
                    Spacer()
                }
                .padding(.horizontal)
                
                // Portfolio summary card
                PortfolioCard()
                
                // Watchlist
                WatchListView()
                
                Spacer()
            }
            .navigationDestination(isPresented: $goToHomeViewIphone) {
                HomeView_iPhone()
            }
        }
    }
    
    // MARK: - Networking
    // Example: Lookup symbols using a search query
    public func getSymbolLookup(searchQuery: String) {
        // Construct your URL components here so they're in scope when used
        let baseURL = "https://api.example.com/lookup?"
        let query = "q=\(searchQuery)"
        let token = "&token=YOUR_API_KEY"
        
        guard let url = URL(string: baseURL + query + token) else {
            print("Invalid URL for symbol lookup")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Lookup Error: \(error.localizedDescription)")
                return
            }
            guard let data = data else { return }
            // TODO: Parse lookup results
            print("Lookup data size: \(data.count) bytes")
        }
        task.resume()
    }
    
    // Example: Fetch a quote for a single symbol
    public func getSymbolQuote(symbol: String) {
        let baseURL = "https://api.example.com/quote?"
        let query = "symbol=\(symbol)"
        let token = "&token=YOUR_API_KEY"
        
        guard let url = URL(string: baseURL + query + token) else {
            print("Invalid URL for quote")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Quote Error: \(error.localizedDescription)")
                return
            }
            guard let data = data else { return }
            // TODO: Parse quote data
            print("Quote data size: \(data.count) bytes")
        }
        task.resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

