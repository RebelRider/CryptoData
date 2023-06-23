//
//  TopMoversView.swift
//  CryptoData
//
//  Created by Kirill Smirnov on 6/16/23.
//

import SwiftUI

struct TopMoversView: View {
    @StateObject var viewModel: ContentViewModel
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Top movers").font(.headline)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(alignment: .bottom) {
                    ForEach(viewModel.topMovingCoins) { coin in
                        NavigationLink {
                            TickerDetailsView(coin: coin)
                        } label: {
                            TopMoverItemView(coin: coin)
                        }

                    }
                }
            }
        }.padding(8)
    }
}

struct TopMoversView_Previews: PreviewProvider {
    static var previews: some View {
        TopMoversView(viewModel: ContentViewModel())
    }
}
