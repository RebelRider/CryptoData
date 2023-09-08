//
//  LazyNavigationView.swift
//  CryptoData
//
//  Created by Kirill Smirnov on 6/25/23.
//

import SwiftUI

struct LazyNavView<Content: View> : View {
    let build: () -> Content
    
    init(_ build: @autoclosure @escaping ()-> Content) {
        self.build  = build
    }
    var body: Content {
        build()
    }
}
