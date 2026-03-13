//
//  HeaderView.swift
//  InvestmentStockApp
//
//  Created by Lavonde Dunigan on 2/24/26.
//

import SwiftUI

struct HeaderView: View {
    
    @Binding var showSheet: Bool
    
    var body: some View {
            HStack {
                Spacer()
                
                Text("My Stocks")
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(Color.darkBlue)

                
                Spacer()
                
                Button(action: { showSheet.toggle() }) {
                    Image(systemName: "magnifyingglass.circle.fill")
                        .foregroundStyle(Color.darkBlue)
                        .font(.system(size: 40))
                       
                        }
                    }
                }
            }

    
    //   struct HeaderView_Previews: PreviewProvider {
    //       static var previews: some View {
    //           HeaderView()
    //               .padding()
    //        }
    //  }
    // }

