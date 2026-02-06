import SwiftUI

struct SignupView: View {
    
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var password: String = ""
    @State var email: String = ""
    
    
    
    var body: some View {
        NavigationStack {
            
            
            ZStack {
                
                
                Backgrounds.gradient1.ignoresSafeArea()
                
                VStack {
                    
                    // Title Section
                    VStack {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .foregroundStyle(Color(.teal))
                        
                        Text("Sign Up")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundStyle(Color(.green))
                        
                        Text("Create an account to continue")
                            .font(.subheadline)
                            .foregroundStyle(Color(hex:"#fcfcfa"))
                    }
                    .padding(.bottom, 30)
                    
                    // form
                    VStack(spacing: 20){
                        
                        // first name
                        VStack {
                            VStack(alignment: .leading) {
                                Text("First Name")
                                    .font(.subheadline)
                                    .fontWeight(.medium)
                                    .foregroundStyle(.white)
                                
                                TextField("Your name", text: $firstName)
                                    .textFieldStyle(.plain)
                                    .padding()
                                    .background(.white.opacity(0.8))
                                    .cornerRadius(10)
                            }
                            
                            
                            // last nameVStack {
                            VStack(alignment: .leading) {
                                Text("Last Name")
                                    .font(.subheadline)
                                    .fontWeight(.medium)
                                    .foregroundStyle(.white)
                                
                                TextField("Your last namw", text: $lastName)
                                    .textFieldStyle(.plain)
                                    .padding()
                                    .background(.white.opacity(0.8))
                                    .cornerRadius(10)
                            }
                            
                            
                            // email
                            VStack(alignment: .leading) {
                                Text("Email")
                                    .font(.subheadline)
                                    .fontWeight(.medium)
                                    .foregroundStyle(.white)
                                
                                TextField("example@mail.com", text: $email)
                                    .textFieldStyle(.plain)
                                    .keyboardType(.emailAddress)
                                    .textInputAutocapitalization(.never)
                                    .padding()
                                    .background(.white.opacity(0.8))
                                    .cornerRadius(10)
                            }
                            
                            
                            // password
                            
                            // button
                            Button(action: {})
                            {
                                Text("Sign Up")
                                    .frame(maxWidth: .infinity)
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.gray)
                                    .cornerRadius(10)
                            }
                            .padding(.horizontal, 20)
                            .padding(.horizontal, 50)
                        }
                    }
                    
                    
                    Spacer()
                }
                .padding(.horizontal,20)
            }
        }
    }
}

    
    
#Preview {
    SignupView()
}

