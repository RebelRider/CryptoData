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
                
                
                //overview
                TickerLowerDetailsView(model: viewModel.overviewSectionModel).padding(.vertical)
                
                //additional details
                TickerLowerDetailsView(model: viewModel.additionalDetailsSectionModel)
            }.padding()
            .navigationTitle("Bitcoin")
        }
    }
}

struct TickerDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        TickerDetailsView(coin: dev.coin)
    }
}
