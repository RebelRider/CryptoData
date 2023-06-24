//
//  ChartView.swift
//  CryptoData
//
//  Created by Kirill Smirnov on 6/23/23.
//

import SwiftUI
import Charts

struct ChartView: View {
    let viewModel: TickerDetailsViewModel
    
    var body: some View {
        
        Chart {
            ForEach (viewModel.chartData) { item in
                LineMark(x: .value("Date", item.date),
                         y: .value("Price", item.value))
                .interpolationMethod(.cardinal)
            }
        }
        .chartXScale(domain: ClosedRange(uncheckedBounds: (
            lower: viewModel.startDate,
            upper: viewModel.endDate)))
        .chartXAxis {
            AxisMarks(position: .bottom, values: viewModel.xAxis)
        }
        
        .chartYScale(domain: ClosedRange(uncheckedBounds: (
            lower: viewModel.minPrice,
            upper: viewModel.maxPrice)))
        .chartYAxis {
            AxisMarks(position: .leading, values: viewModel.yAxis)
        }
        
        
    }
}


//struct ChartView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChartView(viewModel: TickerDetailsViewModel(coin: dev.coin))
//    }
//}
