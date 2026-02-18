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
                    .navigationTitle("My Tasks")
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
                if let task = selectedTask {
                    TaskDetailsView(task: task)
                } else {
                    Text("Select an Task from the list")
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
    let container = try! ModelContainer(for: Task.self, configurations: config)

    let home = Category(name: "Home", colorHex: "#b32741")
    let work = Category(name: "Work", colorHex: "#b36827")
    container.mainContext.insert(home)
    container.mainContext.insert(work)

    let task1 = Task(title: "Mock Data 1", details: "This is a test task", budget: 100, category: home)
    let task2 = Task(title: "Mock Data 2", details: "Complete Forum 1 evaluation and set grades", budget: 0, category: work)
    container.mainContext.insert(task1)
    container.mainContext.insert(task2)

    return HomeView_iPad()
        .modelContainer(container)
}

