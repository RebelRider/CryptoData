//
//  ContentView.swift
//  CryptoData
//
//  Created by Kirill Smirnov on 6/15/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    
//    let timeR = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    
    var body: some View {
        NavigationStack{
            ZStack {
                if viewModel.isLoadingData {
                    LoadingIndicator()
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        TopMoversView(viewModel: viewModel)
                        Divider()
                        AllTickersView(viewModel: viewModel)
                    }
                }
            }
            .navigationTitle("Crypto Data")
            .buttonStyle(.plain)
            .dismissKeyboardOnTap()
        }
//        .onReceive(timeR, perform: { _ in
//            viewModel.fetchCoinsData()
//            print("timer tick")
//        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
