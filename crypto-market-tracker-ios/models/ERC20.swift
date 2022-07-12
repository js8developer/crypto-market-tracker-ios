//
//  ERC20.swift
//  crypto-market-tracker-ios
//
//  Created by Jason Schneider on 7/12/22.
//

import SwiftUI

struct ERC20: Codable, Identifiable {
    let id: String
    let symbol: String
    let name: String
    let image: String
    let current_price: Double
    let market_cap: Double
    let market_cap_rank: Int
    let price_change_24h: Double
    let price_change_percentage_24h: Double
}

//"id": "bitcoin",
//"symbol": "btc",
//"name": "Bitcoin",
//"image": "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
//"current_price": 20004,
//"market_cap": 381016936191,
//"market_cap_rank": 1,

