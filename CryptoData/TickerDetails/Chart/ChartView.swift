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
                .foregroundStyle(viewModel.chartLineColor)
                .shadow(color: viewModel.chartLineColor, radius: 3)
            }
        }
        .chartXScale(domain: ClosedRange(uncheckedBounds: (
            lower: viewModel.startDate,
            upper: viewModel.endDate)))
        .chartXAxis {
            AxisMarks(position: .bottom, values: viewModel.xAxis) { value in
                AxisValueLabel() {
                    if let dateValue = value.as(Date.self) {
                        Text(dateValue.asShortDateString())
                    }
                }
            }
        }
        
        .chartYScale(domain: ClosedRange(uncheckedBounds: (
            lower: (viewModel.minPrice - viewModel.minPrice / 222), // maybe just viewModel.minPrice?
            upper: (viewModel.maxPrice + viewModel.maxPrice / 222)
        )))
        .chartYAxis {
            AxisMarks(position: .leading, values: viewModel.yAxis) { value in // just delete     { value in
                AxisValueLabel() {
                    if let doubleValue = value.as(Double.self) {
                        Text(doubleValue.formattedWithK())
                    }
                }
            }
        }
        
        
    }
}


//struct ChartView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChartView(viewModel: TickerDetailsViewModel(coin: dev.coin))
//    }
//}
