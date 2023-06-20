//
//  AllTickersView.swift
//  CryptoData
//
//  Created by Kirill Smirnov on 6/17/23.
//

import SwiftUI

struct AllTickersView: View {
    @StateObject var viewModel: ContentViewModel
    
    var body: some View {
        VStack(alignment: .leading){
            Text("All coins").font(.headline).padding(3)
            
            HStack{
                Text("Coin")
                Spacer()
                Text("Price")
            }.font(.caption).foregroundColor(.gray).padding(.horizontal, 15)
            
            ScrollView{
                VStack {
                    ForEach(viewModel.coins) { coin in
                        TickerRowView(coin: coin)
                    }
                }
            }
            
        }.padding(.horizontal, 5)
    }
}

//struct AllTickersView_Previews: PreviewProvider {
//    static var previews: some View {
//        AllTickersView()
//    }
//}
