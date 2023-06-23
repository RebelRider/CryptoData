//
//  PreviewMockData.swift
//  CryptoData
//
//  Created by Kirill Smirnov on 6/21/23.
//

import SwiftUI

extension PreviewProvider {
    static var dev: MockPreview {
        return MockPreview.instance
    }
}

class MockPreview {
    static let instance = MockPreview()
    let stat1 = LowerDetailsModel(title: "Current Price",
                                  value: "$29,345",
                                  percentageChange: 19.98)
    let stat2 = LowerDetailsModel(title: "Market Cap",
                                  value: "415.22 B", percentageChange: nil)
    
    let coin = Coin(id: "bitcoin", symbol: "btc", name: "Bitcoin", image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579", currentPrice: 61408, marketCap: 1141731099010, marketCapRank: 1, fullyDilutedValuation: 1285385611303, totalVolume: 67190952980, high24H: 61712, low24H: 56220, priceChange24H: 3952.64, priceChangePercentage24H: 6.87944, marketCapChange24H: 72110681879, marketCapChangePercentage24H: 6.74171, circulatingSupply: 18653043, totalSupply: 21000000, maxSupply: 21000000, ath: 61712, athChangePercentage: -0.97589, athDate: "2021-03-13T20:49:26.606Z", atl: 44.333, atlChangePercentage: 22.65, atlDate: "bla", lastUpdated: "blalba", sparklineIn7D: nil, priceChangePercentage24HInCurrency: 123.44)
}
