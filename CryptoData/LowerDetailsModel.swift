//
//  LowerDetailsModel.swift
//  CryptoData
//
//  Created by Kirill Smirnov on 6/21/23.
//

import SwiftUI

struct LowerDetailsModel: Identifiable {
    let id = UUID().uuidString
    let title: String
    let value: String
    let percentageChange: Double?
    
    init(title: String, value: String, percentageChange: Double? = nil) {
        self.title = title
        self.value = value
        self.percentageChange = percentageChange
    }
}
