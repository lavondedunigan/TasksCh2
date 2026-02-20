import SwiftUI
import SwiftData

struct HomeView_iPad: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var tasks: [Task]
    
    @State private var showCategories = false
    @State private var selectedTaskID: Task.ID? = nil
    
    private var selectedTask: Task? {
        guard let id = selectedTaskID else { return nil }
        return tasks.first { $0.id == id }
    }
    
    var body: some View {
        NavigationStack {
            NavigationSplitView {
                ZStack {
                    Backgrounds.gradient1.ignoresSafeArea()
                    
                    List(selection: $selectedTaskID) {
                        ForEach(tasks) { task in
                            NavigationLink(value: task.id) {
                                Text(task.title)
                            }
                            .tag(task.id)
                        }
                    }
                    .listStyle(.plain)
                    .navigationTitle("My Investments")
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
                }
                
                
            } detail: {
                if let investement = selectedInvestment{
                    InvestmentDetailsView(task: task)
                } else {
                    Text("Select an Investment from the list")
                }
            } // split view
            
            .navigationDestination(isPresented: $showCategories) {
                CategoriesViews()
            }
            
        }// stack view
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Investment.self, configurations: config)

    let home = Category(name: "Home", colorHex: "#b32741")
    let work = Category(name: "Work", colorHex: "#b36827")
    let other = Category(name: "Other", colorHex: "#27b341")
    let random = Category(name: "Random", colorHex: "#4127b3")
    let moreRandom = Category(name: "More Random", colorHex: "#b34127")
    let evenMoreRandom = Category(name: "Even More Random", colorHex: "#27b341")
    container.mainContext.insert(home)
    container.mainContext.insert(work)

    let task1 = Task(title: "Mock Data 1", details: "This is a test task", budget: 100, category: home)
    let task2 = Task(title: "Mock Data 2", details: "Complete Forum 1 evaluation and set grades", budget: 0, category: work)
    let task3 = Task(title: "Mock Data 3", details: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", budget: 50, category: other)
    let task4 = Task(title: "Mock Data 4", details: "Phasellus euismod nisi quis semper lobortis.", budget: 200, category: random)
    let task5 = Task(title: "Mock Data 5", details: "Nulla facilisi. Cras eget nisi vitae sem fringilla rhoncus.", budget: 150, category: moreRandom)
    let task6 = Task(title: "Mock Data 6", details: "Donec vitae justo eget elit viverra luctus.", budget: 80, category: evenMoreRandom)
    container.mainContext.insert(inv1)
    container.mainContext.insert(inv2)
    

    return HomeView_iPad()
        .modelContainer(container)
}

