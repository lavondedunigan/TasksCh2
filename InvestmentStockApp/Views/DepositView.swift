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
                 
                }
            }
            
            

        }

       
    }
}

#Preview {
    DepositView()
}
