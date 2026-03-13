import SwiftUI

struct PortfolioCard: View {
    @State private var isShowingDepositView: Bool = false
    @State private var isShowingWithdrawView: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("Portfolio Value")
                    .font(Font.title.bold())
                    .padding(.bottom, 10)
                    .foregroundStyle(Color.white)
                    .cornerRadius(20)
                    .padding(.horizontal, 10)
                    .padding(.top, 10).padding(10)
                    .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 0)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
                    
                    
                
                Text("$1332.30")
                    .foregroundStyle(Color.green)
                    .font(.title2)
                    
                
                HStack(alignment: .top) {
                    Text("$1332.30")
                        .bold()
                        .foregroundStyle(Color.white)
                        .font(.system(size: 50))
                    Text("2.5%")
                        .foregroundStyle(Color.lightGrreen)
                        .bold()
                        .font(.title3)
                }
                
                Spacer()
                
                HStack {
                    Button(action: {
                        // logic
                        isShowingDepositView = true
                    }) {
                        Text("Deposit")
                            .foregroundStyle(Color.white)
                            .bold()
                            .padding()
                            .padding(.horizontal)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.brown)
                                    .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 0)
                                    .cornerRadius(10)
                                    .padding(.horizontal, 10)
                                    .padding(.top, 10)
                                    .padding(.bottom, 10)
                                    .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 0)
                                    .cornerRadius(10)
                    
                            )
                        
                        
                        
                    }
                    
                    Button(action: {
                        // logic
                        isShowingWithdrawView = true
                    }) {
                        Text("Withdraw")
                            .foregroundStyle(Color.white)
                            .bold()
                            .padding()
                            .padding(.horizontal)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.gray).cornerRadius(10)
                                    .padding(.horizontal, 10)
                                    .padding(.top, 10)
                                    .padding(.bottom, 10)
                                    .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 0)
                                    .cornerRadius(10)
                            )
                    }

                    Spacer()
                    
                }
                .navigationDestination(isPresented: $isShowingDepositView){
                    DepositView()
                }
                
                .navigationDestination(isPresented: $isShowingWithdrawView){
                    WithdrawView()
                }
            }
            .padding()
            .frame(height: UIScreen.main.bounds.height / 4)
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 30)
                    .fill(Color.darkBlue)
            )
        }
    }
    }

struct PortfolioCard_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioCard()
            .preferredColorScheme(.dark)
    }
}

