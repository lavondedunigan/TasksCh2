import SwiftUI
import SwiftData

struct CategoriesViews: View {
    @State private var showCategorySheet: Bool = false

    @Environment(\.modelContext) private var modelContext: ModelContext
    @Query private var categories: [Category]
                                    
    var body: some View {
        NavigationStack {
            ZStack  {
                Backgrounds.gradient1.ignoresSafeArea()
                
                List {
                    ForEach(categories) { category in
                        NavigationLink(value:category) {
                           CategoryRowView(category: category)
                                
                        }
                    }
                }
                .listStyle(.plain)
                .navigationTitle("My Categories")
                .toolbar {
                    ToolbarItem {
                        Button(action: { showCategorySheet = true}) {
                            Label("Add Item", systemImage: "plus")
                        }
                    }
                }
            }
        } // zstack
        .sheet(isPresented: $showCategorySheet) {
            CategoryView()
        }
    } // nav stack
} // body end

    
#Preview {
    
    let cofig = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Task.self, configurations: cofig)
    
    // insert data in container
    let home = Category(name: "Home", colorHex: "#b32741")
    let work = Category(name: "Work", colorHex: "#b36827")
    container.mainContext.insert(home)
    container.mainContext.insert(work)
    
    let task1 = Task(title: "Mock Data 1", details: "This is a test task", budget: 100, category: home)
    let task2 = Task(title: "Mock Data 2", details: "Complete Forum 1 evaluation and set grades", budget: 0, category: work)
    
    container.mainContext.insert(task1)
    container.mainContext.insert(task2)


    return CategoriesViews()
        .modelContainer(container)
}

