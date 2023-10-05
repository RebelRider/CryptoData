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
        formatter.minimumFractionDigits = 1
        formatter.maximumFractionDigits = 2
        return formatter
    }
    private var currencyFormatterSmall: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 3
        formatter.maximumFractionDigits = 4
        return formatter
    }
    
    private var numFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 1
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    func asNumberString() -> String {
        return String(format: "%.2f", self)
    }
    
    func toCurrency() -> String {
        if self > 0.01 { //solve problem with really small price?
            return currencyFormatter.string(for: self) ?? " " }
        else {
            return currencyFormatterSmall.string(for: self) ?? " " }
    }
    
    func toReadablePercent() -> String {
        return (numFormatter.string(for: self) ?? " ") + " %"
    }
    
    //convert 123456 to 123.45K
    func formattedWithK () -> String {
        let num = abs(Double(self))
        let signNegative = (self < 0) ? "-" : ""
        switch num {
        case 1_000_000_000_000...:
            let formatted = num / 1_000_000_000_000
            let stringFormatted = formatted.asNumberString()
            return "\(signNegative)\(stringFormatted) Tr"
        case 1_000_000_000...:
            let formatted = num / 1_000_000_000
            let stringFormatted = formatted.asNumberString()
            return "\(signNegative)\(stringFormatted) Bn"
        case 1_000_000...:
            let formatted = num / 1_000_000
            let stringFormatted = formatted.asNumberString()
            return "\(signNegative)\(stringFormatted) M"
        case 1_000...:
            let formatted = num / 1_000
            let stringFormatted = formatted.asNumberString()
            return "\(signNegative)\(stringFormatted) K"
        default:
            return "\(signNegative)\(self.toCurrency())"
        }
        
    }
}
