//
//  DepositView.swift
//  InvestmentStockApp
//
//  Created by Lavonde Dunigan on 3/11/26.
//

import SwiftUI

struct DepositView: View {
    var body: some View {
        NavigationStack {
            ZStack{
                Backgrounds.gradient1.ignoresSafeArea()
                VStack {
                    Text("You can deposit here!")
                        .foregroundColor(.white)
                        .bold()
                        .font(.title2)
                    
                    Text("Deposit")
                        .font(.subheadline)
                        .foregroundStyle(.black)
                        .bold()
                        .padding(8)
                        .background(Color.blue)
                        .cornerRadius(8)
                        .shadow(radius: 5)
                        .padding()
                }
            }
        }
    }
    
#if DEBUG
struct DepositView_Previews: PreviewProvider {
    static var previews: some View {
        DepositView()
    }
}
#endif
}
