//
//  ContentView.swift
//  CryptoData
//
//  Created by Kirill Smirnov on 6/15/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView  {
            ScrollView(.vertical, showsIndicators: false) {
                
            }.navigationTitle("Live Prices")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
