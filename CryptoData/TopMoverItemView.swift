//
//  TopMoverItemView.swift
//  CryptoData
//
//  Created by Kirill Smirnov on 6/16/23.
//

import SwiftUI

struct TopMoverItemView: View {
    var body: some View {
        
        HStack{
            VStack(alignment: .leading){
                Image(systemName: "bitcoinsign.circle.fill")
                    .resizable()
                    .frame(width: 36, height: 36)
                    .foregroundColor(.orange)
                Text("BTC")
                    .font(.body)
                    .fontWeight(.bold)
            }
            VStack(alignment: .trailing){
                Text("$24.559")
                    .font(.title3)
                    .fontWeight(.heavy)
                Text("+" + "11.3%")
                    .font(.title2)
                    .foregroundColor(.green)
                    .fontWeight(.bold)
            }
        }
        .padding(11.0)
        .frame(width: 152, height: 111)
        .overlay(RoundedRectangle(cornerRadius: 10.1).stroke(Color(.systemGray4),lineWidth: 1.5))
        
    }
}

struct TopMoverItemView_Previews: PreviewProvider {
    static var previews: some View {
        TopMoverItemView()
    }
}
