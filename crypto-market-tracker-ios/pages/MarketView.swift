//
//  MarketView.swift
//  crypto-market-tracker-ios
//
//  Created by Jason Schneider on 7/12/22.
//

import SwiftUI



struct MarketView_Previews: PreviewProvider {
    static var previews: some View {
        MarketView()
    }
}


struct MarketView: View {
    
    @StateObject var manager = MarketManager()
    
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false){
            VStack(spacing: 30) {
                MarketHeader(manager: manager)
                MarketSortGroup(manager: manager)
                LastUpdatedView(manager: manager)
                CoinList(manager: manager)
            }
            .padding()
        }
    }
}

