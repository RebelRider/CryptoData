//
//  TickerDetailsView.swift
//  CryptoData
//
//  Created by Kirill Smirnov on 6/21/23.
//

import SwiftUI

struct TickerDetailsView: View {
    let viewModel: TickerDetailsViewModel
    
    init(coin: Coin) {
        self.viewModel = TickerDetailsViewModel(coin: coin)
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                //chart
                ChartView(viewModel: viewModel)
                    .frame(height: 266)//.background(Color(.systemGray))
                
                //overview
                TickerLowerDetailsView(model: viewModel.overviewSectionModel).padding(.vertical)
                
                //additional details
                TickerLowerDetailsView(model: viewModel.additionalDetailsSectionModel)
            }.padding()
                .navigationTitle(" ")
        }
        Spacer()
    }
}

struct TickerDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        TickerDetailsView(coin: dev.coin)
    }
}
