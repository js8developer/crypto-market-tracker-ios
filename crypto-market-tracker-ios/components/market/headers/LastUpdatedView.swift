//
//  LastUpdatedView.swift
//  crypto-market-tracker-ios
//
//  Created by Jason Schneider on 7/12/22.
//

import SwiftUI

struct LastUpdatedView_Previews: PreviewProvider {
    static var previews: some View {
        LastUpdatedView(manager: MarketManager())
    }
}



struct LastUpdatedView: View {
    
    @ObservedObject var manager: MarketManager
    
    var formattedDateTime: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
         
        let date = manager.lastUpdate
        dateFormatter.locale = Locale(identifier: "en_US")
        print(dateFormatter.string(from: date))
        return dateFormatter.string(from: date)
    }
    
    
    
    var body: some View {
        
        Text("Last updated:   \(formattedDateTime)")
            .foregroundColor(.gray)
                
    }
    
}
