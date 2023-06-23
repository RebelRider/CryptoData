//
//  DateExtension.swift
//  CryptoData
//
//  Created by Kirill Smirnov on 6/23/23.
//

import SwiftUI

extension Date {
    // "2023-03-13723:18:10.268Z"
    init(coinUglyString: String) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        let date = formatter.date(from: coinUglyString) ?? Date()
        self.init(timeInterval: 0, since: date)
    }
}
