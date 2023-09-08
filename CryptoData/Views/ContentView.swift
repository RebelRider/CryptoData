//
//  ContentView.swift
//  CryptoData
//
//  Created by Kirill Smirnov on 6/15/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        NavigationView{
            ZStack {
                ScrollView(.vertical, showsIndicators: false) {
                    TopMoversView(viewModel: viewModel)
                    Divider()
                    AllTickersView(viewModel: viewModel)
                }
                if viewModel.isLoadingData {
                    LoadingIndicator()
                }
            }.navigationTitle("Live Prices")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
