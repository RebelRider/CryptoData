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
        //NavigationView {
            ScrollView(showsIndicators: true) {
                //chart
                ChartView(viewModel: viewModel)
                    .padding(3)
                    .frame(maxHeight: 355)//.background(Color(.systemGray))
                
                //24h change
                TickerLowerDetailsView(model: viewModel.additionalDetailsSectionModel)
                //overview
                TickerLowerDetailsView(model: viewModel.overviewSectionModel).padding(.top)
                
            }.padding()
                .navigationTitle(viewModel.tickerName)
        
        Spacer()
    }
}

struct TickerDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        TickerDetailsView(coin: dev.coin)
    }
}
