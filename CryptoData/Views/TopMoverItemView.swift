//
//  TopMoverItemView.swift
//  CryptoData
//
//  Created by Kirill Smirnov on 6/16/23.
//

import SwiftUI
import Kingfisher

struct TopMoverItemView: View {
    let coin: Coin
    
    var body: some View {
        
        HStack{
            VStack(alignment: .center){
                KFImage(URL(string: coin.image))
                    .resizable()
                    .frame(width: 36, height: 36)
                    .foregroundColor(.orange)
                Text(coin.symbol.uppercased())
                    .font(.body)
                    .fontWeight(.bold)
                    .foregroundColor(Color.theme.primaryTextColor)
            }.padding(.horizontal, 6)
            VStack(alignment: .center){
                Text(coin.currentPrice.toCurrency())
                    .font(.title3)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.primaryTextColor)
                Text(coin.priceChangePercentage24H.toReadablePercent())
                    .font(.title2)
                    .foregroundColor(coin.priceChangePercentage24H > 0 ? .green : .red)
                    .fontWeight(.bold)
            }.padding(.trailing, 9)
        }
        .padding(2)
        .frame(height: 88)
        //.background(Color("TopMoversBackground"))
        .overlay(RoundedRectangle(cornerRadius: 14.1).stroke(Color(.systemGray4),lineWidth: 0.5))
        
    }
}

struct TopMoverItemView_Previews: PreviewProvider {
    static var previews: some View {
        TopMoverItemView(coin: Coin(id: "bitcoin", symbol: "btc", name: "Bitcoin", image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579", currentPrice: 61408, marketCap: 1141731099010, marketCapRank: 1, fullyDilutedValuation: 1285385611303, totalVolume: 67190952980, high24H: 61712, low24H: 56220, priceChange24H: 3.22, priceChangePercentage24H: 6.87944, marketCapChange24H: 72110681879, marketCapChangePercentage24H: 6.74171, circulatingSupply: 18653043, totalSupply: 21000000, maxSupply: 21000000, ath: 61712, athChangePercentage: -0.97589, athDate: "2021-03-13T20:49:26.606Z", atl: 44.333, atlChangePercentage: 22.65, atlDate: "bla", lastUpdated: "blalba", sparklineIn7D: nil, priceChangePercentage24HInCurrency: 123.44))
    }
}
