import SwiftUI
import SwiftData

struct TaskDetailsView: View {
    let task: Task
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                Backgrounds.gradient3.ignoresSafeArea()
                
                VStack {
                    Text("Task Title:")
                        .font(.subheadline)
                        .foregroundStyle(.yellow)
                        .padding()
                        .padding(.bottom, 10)
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.2), radius: 5)
                        .padding()
                        .background(Color.white.opacity(0.1))
                    
                    Text(task.title)
                        .font(.headline)
                        .foregroundStyle(.black)
                        .padding()
                        .padding(.bottom, 10)
                        .cornerRadius(10)
                        .shadow(color: Color.darkBlue.opacity(0.2), radius: 5)
                        .padding()
                        .background(Color.white.opacity(0.1))
                    
                    Text("Task Details:")
                        .font(.subheadline)
                        .foregroundStyle(.yellow)
                        .padding()
                        .padding(.bottom, 10)
                        .cornerRadius(10)
                        .shadow(color: Color.darkBlue.opacity(0.2), radius: 5)
                        .padding()
                        .background(Color.white.opacity(0.1))
                    
                    Text(task.details)
                        .font(.body)
                }
            }
        }
    }
}

#Preview {
    let work = Category(name: "Work", colorHex: "#b36827")
    let task1 = Task(title: "Mock Data 1", details: "long description here", budget: 100, category: work)
    TaskDetailsView(task: task1)
}
