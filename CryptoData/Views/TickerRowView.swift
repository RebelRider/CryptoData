//
//  TickerRowView.swift
//  CryptoData
//
//  Created by Kirill Smirnov on 6/17/23.
//

import SwiftUI
import Kingfisher

struct TickerRowView: View {
    let coin: Coin
    
    var body: some View {
        HStack {
            Text("\(Int(coin.marketCapRank ?? 1))").font(.caption).foregroundColor(.gray)
            KFImage(URL(string: coin.image))
                .resizable().scaledToFit().frame(width: 33, height: 33)
            VStack(alignment: .leading){
                Text(coin.name).font(.subheadline)
                Text(coin.symbol.uppercased()).font(.caption).fontWeight(.heavy)
            }.padding(.leading, 7)
                .foregroundColor(Color.theme.primaryTextColor)
            Spacer()
            VStack(alignment: .trailing){
                Text(coin.currentPrice.toCurrency()).font(.subheadline)
                Text(coin.priceChangePercentage24H.toReadablePercent()).font(.caption).fontWeight(.heavy)
                    .foregroundColor(coin.priceChangePercentage24H > 0 ? .green : .red)
            }.padding(.trailing, 9)
                .foregroundColor(Color.theme.primaryTextColor)

        }.padding(3)
    }
}

//struct TickerRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        TickerRowView()
//    }
//}
