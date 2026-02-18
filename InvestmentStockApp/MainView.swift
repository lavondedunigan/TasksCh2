import SwiftUI
import SwiftData

@main
struct InvestmentStockApp: App {
    @Environment(\.horizontalSizeClass) private var hsizeClass
    @AppStorage("isLoggedIn") private var isLoggedIn: Bool = false
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self, // TO REMOVE
            User.self,
            Category.self,
            Task.self,
            Investment.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        
        do {
            let container = try ModelContainer(for: schema, configurations: [modelConfiguration])
            let context = container.mainContext
            
            // Preload dats IF NEEDED
            preloadDataIfNeeded(context)
            
            return container
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                if isLoggedIn {
                    if hsizeClass == .compact {
                      
                        HomeView_iPad()
                            .transition(.move(edge: .trailing))
                    }
                    else {
                        
                        HomeView_iPhone()
                            .transition(.move(edge: .trailing))
                    }
                    
                }
                else {
                    LoginView()
                        .transition(.move(edge: .leading))
                }
            }
        }
        .modelContainer(sharedModelContainer)
    }
    
    @MainActor
    static func preloadDataIfNeeded(_ context: ModelContext) {
        // if database is empty, insert a few records
        
        
        // MARK: -- if there are no categories, insert some
        let categories = try? context.fetch(FetchDescriptor<Category>())
        guard categories?.isEmpty == true else {
            print("Categories: No seed required")
            return // do nothing
        }
        // seed some cats
        let home = Category(name: "Retirement", colorHex: "#b32741")
        let work = Category(name: "Vacation to Bali", colorHex: "#b36827")
        
        context.insert(home)
        context.insert(work)
      
        
        
        // tasks
        let task1 = Task(title: "Family vacation", details: "long description here", budget: 100, category: home)
        let task2 = Task(title: "Retirement", details: "Complete Forum 1 evaluation and set grades", budget: 0, category: work)
        let task3 = Task(title: "New Home", details: "buy a new home", budget: 1000000, category: home)
        let task4 = Task(title: "New Car", details: "buy a new car", budget: 70000, category: work)
        let task5 = Task(title: "New Laptop", details: "buy a new laptop", budget: 1000, category: work)
        let task6 = Task(title: "New Phone", details: "buy a new phone", budget: 500, category: home)
        
        // investments
        let inv1 = Investment(title: "Netflix", stock: "ntf", stockPrice: 200.0, ammount: 2000, shares: 10, category: home)
        let inv2 = Investment(title: "Zillow", stock: "z", stockPrice: 100.0, ammount: 3000, shares: 30, category: work)
        let in3 = Investment(title: "Apple", stock: "aapl", stockPrice: 150.0, ammount: 4000, shares: 20, category: work)
        let in4 = Investment(title: "SpaceX", stock: "spacex", stockPrice: 1000.0, ammount: 5000, shares: 5, category: work)
        let in5 = Investment(title: "Tesla", stock: "tsla", stockPrice: 700.0, ammount: 6000, shares: 4, category: home)
        let in6 = Investment(title: "Meta", stock: "meta", stockPrice: 600.0, ammount: 7000, shares: 3, category: home)
        
        context.insert(task1)
        context.insert(task2)
        context.insert(task3)
        context.insert(task4)
        context.insert(task5)
        context.insert(task6)
        
        context.insert(inv1)
        context.insert(inv2)
        context.insert(in3)
        context.insert(in4)
        context.insert(in5)
        context.insert(in6)
        
        // save changes
        try? context.save()
        print("Data seeded!!")
       
 
    }
}
