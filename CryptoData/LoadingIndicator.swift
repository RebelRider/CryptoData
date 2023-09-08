//
//  LoadingIndicator.swift
//  CryptoData
//
//  Created by Kirill Smirnov on 6/25/23.
//

import SwiftUI

struct LoadingIndicator: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(.circular)
            .accentColor(.white)
            .scaleEffect(x: 1.4, y: 1.4, anchor: .center)
    }
}

struct LoadingIndicator_Previews: PreviewProvider {
    static var previews: some View {
        LoadingIndicator()
    }
}
