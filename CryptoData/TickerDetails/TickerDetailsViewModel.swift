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
    
    
    var overviewSectionModel: TickerDetailsSectionModel {
        //price
        let price = coin.currentPrice.toCurrency()
        let priceChange24h = coin.priceChange24H
        let priceStats = LowerDetailsModel(title: "Current Price", value: price, percentageChange: priceChange24h)
        //market cap
        let marketCap = coin.marketCap ?? 0.001
        let marketCapPercentChange = coin.marketCapChange24H
        let marketCapStats = LowerDetailsModel(title: "Market Cap", value: String(marketCap), percentageChange: marketCapPercentChange)
        //rank
        let rank = coin.marketCapRank
        let rankStat = LowerDetailsModel(title: "Rank", value: "\(String(describing: rank))", percentageChange: nil)
        //volume
        let volume = coin.totalVolume
        let volumeStat = LowerDetailsModel(title: "Volume", value: "\(String(describing: volume))", percentageChange: nil)
        
        
        return TickerDetailsSectionModel(title: "Overview", stats: [priceStats, marketCapStats, rankStat, volumeStat])
    }
    
    var additionalDetailsSectionModel: TickerDetailsSectionModel {
        //24h high
        let high = coin.high24H?.toCurrency() ?? "n/a"
        let highStat = LowerDetailsModel(title: "24h HIGH", value: high, percentageChange: nil)
        //24h low
        let low = coin.low24H?.toCurrency() ?? "n/a"
        let lowStat = LowerDetailsModel(title: "24h LOW", value: low, percentageChange: nil)
        //24h price change
        //24h market cap change
        return TickerDetailsSectionModel(title: " ", stats: [highStat, lowStat])
    }
    
    
    
    init(coin: Coin) {
        self.coin = coin
        configureChartData()//do not forget to call this on init
    }
    
    func configureChartData() {
        guard let priceData = coin.sparklineIn7D?.price else { return } //price as array of Double
        
        var index = 0
        self.minPrice = priceData.min()!
        self.maxPrice = priceData.max()!
        self.endDate = Date(coinUglyString: coin.lastUpdated ?? "")
        self.startDate = endDate.addingTimeInterval(-7 * 60 * 60 * 24)
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