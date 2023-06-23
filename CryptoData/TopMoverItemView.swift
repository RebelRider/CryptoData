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
            }
            VStack(alignment: .center){
                Text(coin.currentPrice.toCurrency())
                    .font(.title3)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.primaryTextColor)
                Text(coin.priceChange24H.toReadablePercent())
                    .font(.title2)
                    .foregroundColor(coin.priceChangePercentage24H > 0 ? .green : .red)
                    .fontWeight(.bold)
            }
        }
        .padding(2)
        .frame(width: 155, height: 88)
        //.background(Color("TopMoversBackground"))
        .overlay(RoundedRectangle(cornerRadius: 14.1).stroke(Color(.systemGray4),lineWidth: 1.5))
        
    }
}

//struct TopMoverItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        TopMoverItemView()
//    }
//}
