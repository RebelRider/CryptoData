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
        VStack {
            Divider()
            HStack {
                Text("\(Int(coin.marketCapRank ?? 1))").font(.caption).foregroundColor(.gray)
                KFImage(URL(string: coin.image))
                    .resizable().scaledToFit().frame(height: 38).shadow(radius: 2)
                VStack(alignment: .leading){
                    Text(coin.name).font(.subheadline)
                    Text(coin.symbol.uppercased()).font(.headline).fontWeight(.heavy)
                }.padding(.leading, 5)
                    .foregroundColor(Color.theme.primaryTextColor)
                Spacer()
                VStack(alignment: .trailing){
                    Text(coin.currentPrice.toCurrency()).font(.subheadline)
                    Text(coin.priceChangePercentage24H.toReadablePercent()).font(.callout).fontWeight(.heavy)
                        .foregroundColor(coin.priceChangePercentage24H > 0 ? .green : .red)
                        .shadow(color: .black, radius: 1, x: 1, y: 1)
                }.padding(.trailing, 9)
                    .foregroundColor(Color.theme.primaryTextColor)

            }.padding(6)
        }
    }
}

struct TickerRowView_Previews: PreviewProvider {
    static var previews: some View {
        TickerRowView(coin: MockPreview().coin)
    }
}
