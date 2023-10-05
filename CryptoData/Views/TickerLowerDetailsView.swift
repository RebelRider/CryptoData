//
//  TickerLowerDetailsView.swift
//  CryptoData
//
//  Created by Kirill Smirnov on 6/21/23.
//

import SwiftUI

struct TickerLowerDetailsView: View {
    let model: TickerDetailsSectionModel
    
    private let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack {
            Text(model.title).font(.title2).bold()
                .frame(maxWidth: .infinity, alignment: .leading)
//            Divider()
            
            LazyVGrid(columns: columns, alignment: .leading, spacing: 19) {
                ForEach(model.stats) { stat in
                    ThreeRowsView(model: stat)
                }
            }
        }
    }
}

//MARK: - THREE ROWS VIEW - REUSABLE
struct ThreeRowsView: View {
    let model: LowerDetailsModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(model.title).font(.caption).fontWeight(.thin)
            Text(model.value).font(.title2)
            if model.percentageChange != nil {
                HStack {
                    Image(systemName: model.percentageChange ?? 1 > 0 ? "arrowtriangle.up.fill" : "arrowtriangle.down.fill")
                    Text(model.percentageChange?.toReadablePercent() ?? " ")
                        .font(.headline)
                }.font(.caption).foregroundColor(Color(model.percentageChange ?? 1 > 0 ? .green : . red)).shadow(color:.black, radius: 1, x: 1, y: 1)
            }
        }
    }
}


struct ThreeRowsView_Previews: PreviewProvider {
    static var previews: some View {
        ThreeRowsView(model: dev.stat1)
    }
}
