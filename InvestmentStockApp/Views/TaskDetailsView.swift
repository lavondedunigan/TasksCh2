import SwiftUI
import SwiftData

struct TaskDetailsView: View {
    let task: Task
    
    var body: some View {
        NavigationStack {
            ZStack {
                Backgrounds.gradient3.ignoresSafeArea()
                VStack(spacing: 16) {
                    Text(task.title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .padding(.top)
                        .background(Color.white.opacity(0.1))
                        .shadow(color: Color.gray.opacity(0.2), radius: 5)

                    Text(task.category.name)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.white.opacity(0.1))
                        .shadow(color: Color.darkBlue.opacity(0.2), radius: 5)

                    Text("$\(task.budget)")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.white.opacity(0.1))
                        .shadow(color: Color.darkBlue.opacity(0.2), radius: 5)

                    Text(task.details)
                        .font(.body)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.white.opacity(0.1))
                        .shadow(color: Color.darkBlue.opacity(0.2), radius: 5)

                    Spacer()
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    let work = Category(name: "Results of WatchList", colorHex: "#b36827")
    let task1 = Task(title: "Goals Results", details: "Stockdata", budget: 6000, category: work)
    TaskDetailsView(task: task1)
}
