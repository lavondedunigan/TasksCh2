import SwiftUI
import SwiftData

struct CategoryView: View {
    @State private var categoryName: String = ""
    @State private var selectedColor: Color = .teal

    var body: some View {
        ZStack {
            Backgrounds.gradient1.ignoresSafeArea()

            Form {
                Section(header: Text("Category Details")) {
                    TextField("Category Name", text: $categoryName)
                        .contrast(0.5)
                        .padding()
                        .foregroundColor(.darkBlue)
                        .multilineTextAlignment(.center)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .textInputAutocapitalization(.never)
                        .bold()
                }

                Section(header: Text("Category Color")) {
                    ColorPicker(selection: $selectedColor) {
                        Text("Select a color for your category!")
                            .foregroundStyle(.primary)
                    }
                }

                Section {
                    Button(action: addCategory) {
                        Text("Add Category")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.teal)
                            .cornerRadius(10)
                    }
                }

                Section {
                    Button(action: skip) {
                        Text("Skip")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.yellow)
                            .cornerRadius(10)
                    }
                }

                Section {
                    Button(action: previewColor) {
                        HStack {
                            Image(systemName: "paintpalette")
                            Text("Preview Color")
                        }
                    }
                }

                Section {
                    Button(action: cancel) {
                        Text("Cancel")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.red)
                            .cornerRadius(10)
                    }
                }
            }
            .scrollContentBackground(.hidden)
        }
        .navigationTitle("Create Category")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Cancel", action: cancel)
            }
        }
        .onAppear {
            // Perform any initial setup if needed
        }
    }

    // MARK: - Actions
    private func addCategory() {
        // TODO: Implement adding a category using SwiftData
        // Validate input
        // Save model
    }

    private func skip() {
        // TODO: Implement skip behavior (e.g., dismiss)
    }

    private func previewColor() {
        // TODO: Implement preview behavior if desired
    }

    private func cancel() {
        // TODO: Implement cancel behavior (e.g., dismiss)
    }
}
#Preview {
    NavigationStack {
        CategoryView()
    }
}

