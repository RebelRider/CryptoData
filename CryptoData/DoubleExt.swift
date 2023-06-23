//
//  DoubleExt.swift
//  CryptoData
//
//  Created by Kirill Smirnov on 6/20/23.
//

import Foundation

extension Double {
    private var currencyFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 3
        return formatter
    }
    private var currencyFormatterSmall: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 4
        formatter.maximumFractionDigits = 5
        return formatter
    }
    
    private var numFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    func toCurrency() -> String {
        if self > 0.01 { //solve problem with really small price?
            return currencyFormatter.string(for: self) ?? "0.00" }
        else {
            return currencyFormatterSmall.string(for: self) ?? "0.00" }
    }
    
    func toReadablePercent() -> String {
        return (numFormatter.string(for: self) ?? " ") + " %"
    }
}
