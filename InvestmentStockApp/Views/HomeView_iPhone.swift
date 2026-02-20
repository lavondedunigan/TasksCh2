import SwiftUI
import SwiftData

struct HomeView_iPhone: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var investments: [Investment]
    
    @State private var showCategories = false
    @State private var selectedTaskID: Task.ID? = nil
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                Backgrounds.gradient1.ignoresSafeArea()
                
                List(selection: $selectedTaskID) {
                    ForEach(investments) { inv in
                        NavigationLink {
                            InvestmentDetailsView(investment: inv)
                        } label: {
                            Text(inv.title)
                        }
                    }
                }
                .listStyle(.plain)
                .navigationTitle("My Portfolio")
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button(action: { showCategories = true }) {
                            Text("Special")
                        }
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: {}) {
                            Label("Add Item", systemImage: "plus")
                        }
                    }
                }
            } // ztack
            
            .navigationDestination(isPresented: $showCategories) {
                CategoriesViews()
            }
            
        }
    }
}
    
#Preview {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try! ModelContainer(for: Investment.self, configurations: config)
        
        let home = Category(name: "Retirement", colorHex: "#b32741")
        let work = Category(name: "Vacation to Bali", colorHex: "#b36827")
        let home2 = Category(name: "Going to Thailand", colorHex: "#b32741")
        let work2 = Category(name: "Grandchildren college fund", colorHex: "#b36827")
        let home3 = Category(name: "New home", colorHex: "#b32741")
        let work3 = Category(name: "New car", colorHex: "#b36827")
        let home4 = Category(name: "New electric bike", colorHex: "#b32741")
        let work4 = Category(name: "New shoes", colorHex: "#b36827")
    
        container.mainContext.insert(home)
        container.mainContext.insert(work)
        
        let inv1 = Investment(title: "Netflix", stock: "ntf", stockPrice: 200.0, ammount: 2000, shares: 10, category: home)
        let inv2 = Investment(title: "Zillow", stock: "z", stockPrice: 100.0, ammount: 3000, shares: 30, category: work)
        let inv3 = Investment(title: "Apple", stock: "aapl", stockPrice: 150.0, ammount: 4000, shares: 20, category: home2)
        let inv4 = Investment(title: "Meta", stock: "m", stockPrice: 250.0, ammount: 5000, shares: 40, category: work2)
        let inv5 = Investment(title: "Tesla", stock: "tsla", stockPrice: 300.0, ammount: 6000, shares: 50, category: home3)
        let inv6 = Investment(title: "H&M", stock: "hm", stockPrice: 120.0, ammount: 9000, shares: 60, category: work3)
    
        container.mainContext.insert(inv1)
        container.mainContext.insert(inv2)
        container.mainContext.insert(inv3)
        container.mainContext.insert(inv4)
        container.mainContext.insert(inv5)
        container.mainContext.insert(inv6)
    
    
        
        return HomeView_iPhone()
            .modelContainer(container)
    }

