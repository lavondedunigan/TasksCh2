//
//  WithdrawView.swift
//  InvestmentStockApp
//
//  Created by Lavonde Dunigan on 3/11/26.
//

import SwiftUI

struct WithdrawView: View {
    @State private var message: String = "Enter an amount to withdraw"
    
    var body: some View {
        NavigationStack {
            ZStack {
                Backgrounds.gradient1.ignoresSafeArea()
                VStack {
                    Text("You can withdraw here!")
                        .foregroundColor(.white)
                        .bold()
                        .font(.title2)
                    
                    Text("Withdraw")
                        .font(.subheadline)
                        .foregroundStyle(.black)
                        .bold()
                        .padding(8)
                        .background(Color.gray)
                        .cornerRadius(8)
                        .shadow(radius: 5)
                }
            }
        }
    }
}
#Preview {
    WithdrawView()
}

