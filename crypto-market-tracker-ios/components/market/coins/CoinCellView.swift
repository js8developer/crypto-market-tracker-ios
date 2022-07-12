//
//  CoinCellView.swift
//  crypto-market-tracker-ios
//
//  Created by Jason Schneider on 7/12/22.
//

import SwiftUI


struct CoinCellView_Previews: PreviewProvider {
    static var previews: some View {
        CoinCellView(erc20: sampleERC20)
    }
}


struct CoinCellView: View {
    
    var erc20: ERC20
    
    let imageSize: CGFloat = 50
    
    var formattedCurrentPrice: String {
        return String(format: "%.2f", erc20.current_price)
    }
    var formatted24hPercentChange: String {
        return String(format: "%.2f", erc20.price_change_percentage_24h)
    }
    var percentChangeTextColor: Color {
        return ((erc20.price_change_percentage_24h > 0 ? Color.green : Color.red))
    }
   
    func convertToCurrencyFormat(value: Double) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        guard let formattedNumber = numberFormatter.string(from: NSNumber(value: value)) else { return ""}
        return formattedNumber
    }

    
    
    var body: some View {
        
        HStack(spacing: 16) {
            
            URLImageView(urlString: erc20.image, width: imageSize, height: imageSize)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(erc20.name)
                    .font(.system(size: 17, weight: .semibold))
                
                Text(erc20.symbol.uppercased())
                    .font(.system(size: 17, weight: .regular))
                    .foregroundColor(.gray)
                    
            }
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 4) {
                Text("\(convertToCurrencyFormat(value: erc20.current_price))")
                    .font(.system(size: 17, weight: .regular))
                
                Text("\(formatted24hPercentChange)%")
                    .font(.system(size: 17, weight: .regular))
                    .foregroundColor(percentChangeTextColor)
            }
        }
    }
}
