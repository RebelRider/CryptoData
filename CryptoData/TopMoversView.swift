//
//  TopMoversView.swift
//  CryptoData
//
//  Created by Kirill Smirnov on 6/16/23.
//

import SwiftUI

struct TopMoversView: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("Top movers").font(.headline)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(0 ..< 5, id: \.self) { _ in
                        TopMoverItemView()
                    }
                }
            }
        }.padding(4)
    }
}

struct TopMoversView_Previews: PreviewProvider {
    static var previews: some View {
        TopMoversView()
    }
}
