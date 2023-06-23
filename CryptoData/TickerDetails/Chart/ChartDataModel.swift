//
//  ChartDataModel.swift
//  CryptoData
//
//  Created by Kirill Smirnov on 6/23/23.
//

import SwiftUI

struct ChartDataModel: Identifiable {
    let id = UUID().uuidString
    let date: Date
    let value: Double
}
