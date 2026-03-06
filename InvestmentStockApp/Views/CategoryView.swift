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
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.systemBlue))
                        .cornerRadius(10)
                        .padding(.horizontal)
                        .shadow(color: Color.black.opacity(0.1), radius: 5)
                }
                
                Section(header: Text("Category Color")) {
                    ColorPicker(selection: $selectedColor) {
                        Text("Select a color for your category!")
                            .foregroundStyle(.black)
                    }
                }
                
                Section {
                    Button(action: {}) {
                        Text("Add Category")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                            .padding(.horizontal)
                            .shadow(color: Color.black.opacity(0.1), radius: 5)
                            .padding(.top)
                            .padding(.bottom)
                            .font(.largeTitle)
                            .bold()
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity)
                            .onTapGesture {
                                        
                            }
                        
                    }
                }
                
                Section {
                    Button(action:{})
                    {
                        Text("Skip")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                            .padding(.horizontal)
                            .shadow(color: Color.black.opacity(0.1), radius: 5)
                    }
                }
                
                Section {
                    Button(action: {
                        // TODO: Add action for this button
                    }) {
                        HStack {
                            Image(systemName: "paintpalette")
                            Text("Preview Color")
                        }
                    }
                }
                
                Section {
                    Button(action: {}) {
                        Text("Cancel")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.red)
                            .cornerRadius(10)
                            .padding(.horizontal)
                            .shadow(color: Color.black.opacity(0.1), radius: 5)
                    }
                }
            } // form ends
            .scrollContentBackground(.hidden)
        } // zstack ends
        .navigationTitle("Create Category")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Cancel") {
                    
                    
                }
                
            }
            
        }
        .onAppear {
            
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
    }
}
