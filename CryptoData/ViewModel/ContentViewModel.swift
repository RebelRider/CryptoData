//
//  ContentViewModel.swift
//  CryptoData
//
//  Created by Kirill Smirnov on 6/17/23.
//

import SwiftUI

class ContentViewModel: ObservableObject {
    @Published var isLoadingData = true
    
    @Published var coins = [Coin]()
    @Published var topMovingCoins = [Coin]()
    
    init() {
        fetchCoinsData()
    }
    
    func fetchCoinsData() {
        let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=131&page=1&sparkline=true&price_change_percentage=24h&locale=en&precision=full"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error { //errors of URL session
                print("DEBUG: ERROR -> \(error.localizedDescription)")
                return
            }
            
            if let response = response as? HTTPURLResponse {
                print("DEBUG: Response -> \(response.statusCode)")
            }
            guard let data = data else { return }
            //let dataAsString = String(data: data, encoding: .utf8)
            //print("DEBUG: \(String(describing: dataAsString))")
            
            do {
                let coins = try JSONDecoder().decode([Coin].self, from: data)
                DispatchQueue.main.async {
                    self.coins = coins
                    self.configureTopMovers()
                    self.isLoadingData = false
                }
            }
            catch let error  { //errors of decoding process
                print("DEBUG: error \(error)")
                self.isLoadingData = true
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
                    self.fetchCoinsData()
                }
            }
            
        }.resume()
    }
    
    func configureTopMovers() {
        let topMovers = coins.sorted(by: { $0.priceChangePercentage24H > $1.priceChangePercentage24H })
        self.topMovingCoins = Array(topMovers.prefix(8))
    }
    
}
