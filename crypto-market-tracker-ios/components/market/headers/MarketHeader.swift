//
//  MarketHeader.swift
//  crypto-market-tracker-ios
//
//  Created by Jason Schneider on 7/12/22.
//

import SwiftUI

struct MarketHeader_Previews: PreviewProvider {
    static var previews: some View {
        MarketHeader(manager: MarketManager())
    }
}

struct MarketHeader: View {
    
    @ObservedObject var manager: MarketManager
    
    var body: some View {
         
       
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("Market")
                    .font(.system(size: 34, weight: .bold))
                Spacer()
                
                Button(action: {
                    manager.refreshMarketData()
                }){
                    Text("Refresh Data")
                        .bold()
                }
            }
            
            Text("Powered by CoinGecko 🦎")
                .foregroundColor(.gray)
        }
        
        
        
    }
}

