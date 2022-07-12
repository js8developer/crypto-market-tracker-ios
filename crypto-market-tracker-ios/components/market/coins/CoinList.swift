//
//  CoinList.swift
//  crypto-market-tracker-ios
//
//  Created by Jason Schneider on 7/12/22.
//

import SwiftUI


struct CoinList_Previews: PreviewProvider {
    static var previews: some View {
        CoinList(manager: MarketManager())
    }
}


struct CoinList: View {
    
    @ObservedObject var manager: MarketManager
    
    var body: some View {
        VStack {
            ForEach(manager.erc20s){ (erc20) in
                VStack {
                    CoinCellView(erc20: erc20)
                        .padding(.vertical, 4)
                    Divider()
                }
            }
        }
    }
    
}

