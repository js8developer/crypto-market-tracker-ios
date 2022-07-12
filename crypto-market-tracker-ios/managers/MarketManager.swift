//
//  MarketManager.swift
//  crypto-market-tracker-ios
//
//  Created by Jason Schneider on 7/12/22.
//

import Foundation


class MarketManager: ObservableObject {
    
    let coinGeckoAPI = CoinGeckoAPI()
    
    var allCoins: [ERC20] = []
    @Published var erc20s = [ERC20]()
    @Published var lastUpdate = Date()
    
    init(){
        refreshMarketData()
    }
    
    func refreshMarketData(){
        coinGeckoAPI.fetchMarketData { [weak self] (coins) in
            DispatchQueue.main.async {
                self?.clearValues()
                self?.setValues(coins: coins)
            }
        }
    }
    
    func setValues(coins: [ERC20]){
        self.erc20s = coins
        self.allCoins = coins
        self.lastUpdate = Date()
    }
    
    func clearValues(){
        self.erc20s = []
        self.allCoins = []
    }
    
    

    func sortBy_rank(){
        let coins = allCoins.sorted { $0.market_cap_rank < $1.market_cap_rank }
        erc20s = coins
    }
    func sortBy_name(){
        let coins = allCoins.sorted { $0.name < $1.name }
        erc20s = coins
    }
    func sortBy_symbol(){
        let coins = allCoins.sorted { $0.symbol < $1.symbol }
        erc20s = coins
    }
    func sortBy_price(){
        let coins = allCoins.sorted { $0.current_price < $1.current_price }
        erc20s = coins
    }
}
