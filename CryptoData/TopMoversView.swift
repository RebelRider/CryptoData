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
                HStack{
                    ForEach(viewModel.coins) { coin in
                        TopMoverItemView(coin: coin)
                    }
                }
            }
        }.padding(4)
    }
}

struct TopMoversView_Previews: PreviewProvider {
    static var previews: some View {
        TopMoversView(viewModel: ContentViewModel())
    }
}
