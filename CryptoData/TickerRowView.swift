//
//  TickerRowView.swift
//  CryptoData
//
//  Created by Kirill Smirnov on 6/17/23.
//

import SwiftUI

struct TickerRowView: View {
    let coin: Coin
    
    var body: some View {
        HStack {
            Text("\(coin.marketCapRank ?? 1)").font(.caption).foregroundColor(.gray)
            Image(systemName: "bitcoinsign.circle.fill")
                .resizable().scaledToFit().frame(width: 33, height: 33)
            VStack(alignment: .leading){
                Text(coin.name).font(.subheadline)
                Text(coin.symbol.uppercased()).font(.caption).fontWeight(.heavy)
            }.padding(.leading, 7)
            Spacer()
            VStack(alignment: .trailing){
                Text("\(coin.currentPrice)").font(.subheadline)
                Text("\(coin.priceChangePercentage24H)").font(.caption).fontWeight(.heavy)
                    .foregroundColor(.red)
            }.padding(.trailing, 9)

        }.padding(3)
    }
}

//struct TickerRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        TickerRowView()
//    }
//}
