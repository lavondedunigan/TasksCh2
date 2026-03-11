import SwiftUI
import SwiftData

struct HomeView_iPhone: View {
    @Environment(\.presentationMode) private var presentationMode
    @Environment(\.modelContext) private var modelContext
    @Query private var allInvestments: [Investment]
    @Query private var allCategories: [Category]
    @Query(sort: [SortDescriptor(\Category.name, order: .forward)]) private var categories: [Category]
    
    
    @State private var showCategories = false
    @State private var selectedCategory: Category? = nil
    @State private var selectedInvestmentID: Investment.ID? = nil
    @State private var isPresentingEditInvestmentView: Bool = false
    @State private var isPresentingNewInvestmentView: Bool = false
    @State private var isPresentingNewCategoryView: Bool = false
    @State private var isPresentingSettingsView: Bool = false
    @State private var isPresentingDeleteInvestmentAlert: Bool = false
    @State private var isPresentingDeleteCategoryAlert: Bool = false
    @State private var isPresentingExportImportView: Bool = false
    @State private var isPresentingAboutView: Bool = false
    @State private var isPresentingShareView: Bool = false
    @State private var isPresentingHelpView: Bool = false
    
    
    private var filteredInvestments: [Investment] {
        if let selectedCategory {
            return allInvestments.filter { inv in
                inv.category.id == selectedCategory.id
            }
        }
        if let selectedInvestmentID, let match = allInvestments.first(where: { $0.id == selectedInvestmentID }) {
            return [match]
        }
        return allInvestments
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Backgrounds.gradient1.ignoresSafeArea()
                
                VStack(alignment: .leading, spacing: 0) {
                    // Horizontal scroll of categories
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 12) {
                            // All button
                            Button(action: { selectedCategory = nil }) {
                                CategoryRowView(category: Category(name: "All", colorHex: "000000"))
                                    .frame(maxWidth: 110)
                            }
                            .buttonStyle(.plain)
                            .foregroundColor(.secondary)
                            .opacity(selectedCategory == nil ? 1.0 : 0.3)
                            .padding(.vertical, 16)
                            
                            // Button per category
                            ForEach(categories) { category in
                                Button(action: { selectedCategory = category }) {
                                    CategoryRowView(category: category)
                                }
                                .buttonStyle(.plain)
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    // Investments list
                    List {
                        ForEach(filteredInvestments, id: \.id) { inv in
                            NavigationLink(destination: InvestmentDetailsView(investment: inv)) {
                                HStack(alignment: .top) {
                                    Text(inv.title)
                                        .font(.headline)
                                        .foregroundStyle(.black)
                                        .fontWeight(.bold)
                                        .lineLimit(1)
                                        .fixedSize()
                                        .padding(.trailing, 16)
                                    
                                    Spacer()
                                }
                            }
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("Portfolio")
            .toolbarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: { showCategories = true }) {
                        Text("Stocks")
                            .padding(4)
                            .bold()
                            .foregroundStyle(.black)
                            .font(.headline)
                            .fontWeight(.bold)
                            .background(Color(.yellow))
                            .cornerRadius(8)
                            .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 0)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 16)
                            .fixedSize()
                            .frame(maxWidth: .infinity)
                            .frame(maxHeight: .infinity)
                            .clipped()
                            .onTapGesture {
                                print("Tapped the special button!")
                            }
                    }
                    .accessibilityIdentifier("special-button")
                    .accessibilityLabel(Text("Special"))
                    .padding(.trailing, 6)
                    .padding(.top, 8)
                    .fixedSize()
                    .frame(maxWidth: .infinity)
                    .padding(16)
                    .frame(maxHeight: .infinity)
                    
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {}) {
                        Label("Add Item", systemImage: "plus")
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                            .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 0)
                            .padding(.horizontal, 32)
                            .padding(.vertical, 8)
                            .onTapGesture {
                            }
                            .foregroundColor(.primary)
                            .fixedSize()
                            .frame(maxWidth: .infinity)
                            .frame(maxHeight: .infinity)
                            .clipped()
                            .font(.headline)
                            .fontWeight(.bold)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                            .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 0)
                            .padding(.horizontal, 32)
                            .padding(.vertical, 8)
                            .onTapGesture {
                                
                            }
                    }
                    .accessibilityIdentifier("add-button")
                    .accessibilityLabel(Text("Add a new investment"))
                    .accessibilityHint(Text("Tap to add a new investment"))
                    .padding(.trailing, 6)
                    .padding(.top, 8)
                    .fixedSize()
                    .frame(maxWidth: .infinity)
                }
            }
        }
    }
    
    
    #if DEBUG
    private struct HomeView_iPhone_Previews: View {
        var body: some View {
            previewContent()
        }

        private func previewContent() -> some View {
            let config = ModelConfiguration(isStoredInMemoryOnly: true)
            let container = try! ModelContainer(for: Investment.self, Category.self, configurations: config)
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
            container.mainContext.insert(home2)
            container.mainContext.insert(work2)
            container.mainContext.insert(home3)
            container.mainContext.insert(work3)
            container.mainContext.insert(home4)
            container.mainContext.insert(work4)

            let inv1 = Investment(title: "Netflix", stock: "ntf", stockPrice: 300.0, ammount: 2000, shares: 10, category: home)
            let inv2 = Investment(title: "Zillow", stock: "z", stockPrice: 400.0, ammount: 3000, shares: 30, category: work)
            let inv3 = Investment(title: "Apple", stock: "aapl", stockPrice: 250.0, ammount: 4000, shares: 50, category: home2)
            let inv4 = Investment(title: "Meta", stock: "m", stockPrice: 250.0, ammount: 5000, shares: 40, category: work2)
            let inv5 = Investment(title: "Housing Market", stock: "ashburn", stockPrice: 30000.0, ammount: 6000, shares: 50, category: home3)
            let inv6 = Investment(title: "H&M", stock: "hm", stockPrice: 120.0, ammount: 9000, shares: 60, category: work3)
            let inv7 = Investment(title: "Nike", stock: "nke", stockPrice: 480.0, ammount: 7000, shares: 70, category: home4)
            let inv8 = Investment(title: "Adidas", stock: "adidas", stockPrice: 360.0, ammount: 8000, shares: 80, category: work4)

            container.mainContext.insert(inv1)
            container.mainContext.insert(inv2)
            container.mainContext.insert(inv3)
            container.mainContext.insert(inv4)
            container.mainContext.insert(inv5)
            container.mainContext.insert(inv6)
            container.mainContext.insert(inv7)
            container.mainContext.insert(inv8)

            return HomeView_iPhone().modelContainer(container)
        }
    }

    #Preview("HomeView_iPhone") {
        HomeView_iPhone_Previews()
    }
    #endif
    
}
