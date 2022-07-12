//
//  CoinGeckoAPI.swift
//  crypto-market-tracker-ios
//
//  Created by Jason Schneider on 7/12/22.
//

import Foundation


class CoinGeckoAPI {

    let baseEndpoint = "https://api.coingecko.com/api/v3/coins/markets"
    let fiatCurrency = "usd"
    let maxResults = 50
    
    var queryPath: String {
        return "vs_currency=\(fiatCurrency)&order=market_cap_desc&per_page=\(maxResults)&page=1&sparkline=false"
    }
    
    
    var marketDataEndpoint: String {
        return "\(baseEndpoint)?\(queryPath)"
    }
    
    
    func fetchMarketData(completion: @escaping(([ERC20]) -> Void)) {
        guard let url = URL(string: marketDataEndpoint) else {
            print("Invalid URL")
            return
        }
        let request = URLRequest(url: url)

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let response = try? JSONDecoder().decode([ERC20].self, from: data) {
                    completion(response)
                } else {
                    completion([])
                }
            }
        }.resume()
    }

}
