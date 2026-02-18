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
                            Text("Dogs")
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
        container.mainContext.insert(home)
        container.mainContext.insert(work)
        
        let inv1 = Investment(title: "Netflix", stock: "ntf", stockPrice: 200.0, ammount: 2000, shares: 10, category: home)
        let inv2 = Investment(title: "Zillow", stock: "z", stockPrice: 100.0, ammount: 3000, shares: 30, category: work)
        container.mainContext.insert(inv1)
        container.mainContext.insert(inv2)
        
        return HomeView_iPhone()
            .modelContainer(container)
    }

