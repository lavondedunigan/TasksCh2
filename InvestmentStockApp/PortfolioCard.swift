import SwiftUI

struct PortfolioCard: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Portfolio Value")
                .foregroundStyle(Color.gray)
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
                    Button(action: {}) {
                        Text("Deposit")
                            .foregroundStyle(Color.white)
                            .bold()
                            .padding()
                            .padding(.horizontal)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.blue)
                            )
                           
                                    
                            
                    }

                    Button(action: {}) {
                        Text("Withdraw")
                            .foregroundStyle(Color.white)
                            .bold()
                            .padding()
                            .padding(.horizontal)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.gray)
                            )
                    }
                    Spacer()
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

struct PortfolioCard_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioCard()
            .preferredColorScheme(.dark)
    }
}

