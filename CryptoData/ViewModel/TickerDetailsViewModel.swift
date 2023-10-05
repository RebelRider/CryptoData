//
//  TickerDetailsViewModel.swift
//  CryptoData
//
//  Created by Kirill Smirnov on 6/22/23.
//

import SwiftUI

class TickerDetailsViewModel {
    private let coin: Coin
    
    var chartData = [ChartDataModel]() //initializing now, bcs we can just create a blank array and then populate it
    var xAxis = [Date]()
    var yAxis = [Double]()
    var startDate = Date()
    var endDate = Date()
    var minPrice = 0.0
    var maxPrice = 0.0
    
    var tickerName: String {
        return coin.name
    }
    
    var chartLineColor: Color {
        let priceChange = (coin.sparklineIn7D?.price.last ?? 0) -
        (coin.sparklineIn7D?.price.first ?? 0)
        return priceChange > 0 ? .green : .red
    }
    
    var overviewSectionModel: TickerDetailsSectionModel {
        //price
        let price = coin.currentPrice.toCurrency()
        let priceChange24h = coin.priceChangePercentage24HInCurrency
        let priceStats = LowerDetailsModel(title: "Current Price",
                                           value: price,
                                           percentageChange: priceChange24h)
        //market cap
        let marketCap = coin.marketCap ?? 0.001
        let marketCapChangePerc24h = coin.marketCapChangePercentage24H
        let marketCapStats = LowerDetailsModel(title: "Market Cap",
                                               value: marketCap.formattedWithK(),
                                               percentageChange: marketCapChangePerc24h
                                               )
        //rank
        let rank = coin.marketCapRank
        let rankStat = LowerDetailsModel(title: "Rank",
                                         value: "\(Int(rank ?? 1))")
        //volume
        let volume = coin.totalVolume ?? 0
        let volumeStat = LowerDetailsModel(title: "Volume",
                                           value: volume.formattedWithK())
        //emitted
        let emitted = coin.circulatingSupply
        let emittedStats = LowerDetailsModel(title: "Currently in circulation", value: emitted?.formattedWithK() ?? "")
        
        let fdv = coin.fullyDilutedValuation
        let fdvStats = LowerDetailsModel(title: "Fully Diluted Valuation", value: fdv?.formattedWithK() ?? "")
        
        return TickerDetailsSectionModel(title: "Overview", stats: [priceStats, marketCapStats, rankStat, volumeStat, emittedStats, fdvStats])
    }
    
    var additionalDetailsSectionModel: TickerDetailsSectionModel {
        //24h high
        let high = coin.high24H?.toCurrency() ?? "n/a"
        let highStat = LowerDetailsModel(title: "24h HIGH",
                                         value: high)
        //24h low
        let low = coin.low24H?.toCurrency() ?? "n/a"
        let lowStat = LowerDetailsModel(title: "24h LOW",
                                        value: low)
        //24h price change
        //24h market cap change
        return TickerDetailsSectionModel(title: " ", stats: [highStat, lowStat])
    }
    
    
    
    init(coin: Coin) {
        self.coin = coin
        configureChartData()//do not forget to call this on init
        print("DEBUG: coin is \(coin.name)") // printed even whe delails section didn't opened
    }
    
    //MARK: - configureChartData
    
    func configureChartData() {
        guard let priceData = coin.sparklineIn7D?.price else { return } //price as array of Double
        
        var index = 0
        self.minPrice = priceData.min()!
        self.maxPrice = priceData.max()!
//        self.endDate = Date(coinUglyString: coin.lastUpdated ?? "")
        self.endDate = Date()
        self.startDate = endDate.addingTimeInterval(-7 * 60 * 60 * 24)
        
        print(endDate)
        print(startDate)
        print(minPrice)
        print(maxPrice)
        
        self.xAxis = [startDate, endDate]
        self.yAxis = [minPrice, (minPrice + maxPrice) / 2 ,maxPrice]
        
        for price in priceData.reversed() {
            
            let date = endDate.addingTimeInterval(-1 * 60 * 60 * Double(index))
            
            let chartDataElement = ChartDataModel(date: date, value: price)
            self.chartData.append(chartDataElement)
            index += 1
        }
    }
}

/*
 loop thru prices backwards because we only have end date for time interval
  need to figure out date for each price point
 
  [10, 20, 30, 40] - prices
 [40, 30, 20, 10] - prices reversed
 [4, 3, 2, 1] - dates
 [(4, 40), (3, 30)] - chartData
 
 */
