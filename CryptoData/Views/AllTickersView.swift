//
//  AllTickersView.swift
//  CryptoData
//
//  Created by Kirill Smirnov on 6/17/23.
//

import SwiftUI

struct AllTickersView: View {
    @StateObject var viewModel: ContentViewModel
    @State var searchCoin = ""
    
    var body: some View {
            Text("All coins").font(.headline).padding(3)
        
        VStack(alignment: .leading){
            HStack {
                Image(systemName: "magnifyingglass").font(.title2)
                if searchCoin.count > 0 {
                    Image(systemName: "xmark.circle")
                        .onTapGesture {
                            searchCoin = ""
                        }
                }
                TextField("___", text: $searchCoin)
                Spacer()
            }.padding(.horizontal)
                .padding(.leading,44)
            
            HStack{
                Text("Coin")
                Spacer()
                Text("Price")
            }.font(.caption).foregroundColor(.gray).padding(.horizontal, 15)
            
            ScrollView{
                VStack {
                    ForEach(searchCoin.count == 0 ? viewModel.coins :  viewModel.coins.filter({$0.name.lowercased().contains(searchCoin.lowercased())
                        || $0.symbol.lowercased().contains(searchCoin.lowercased())})
                    ) { coin in
                        NavigationLink {
                            LazyNavView(TickerDetailsView(coin: coin))
                        } label: {
                            TickerRowView(coin: coin)
                        }

                    }//.searchable(text: $searchCoin)
                }
            }
            
        }.padding(.horizontal, 5)
    }
}

struct AllTickersView_Previews: PreviewProvider {
    static var previews: some View {
        AllTickersView(viewModel: ContentViewModel())
    }
}
