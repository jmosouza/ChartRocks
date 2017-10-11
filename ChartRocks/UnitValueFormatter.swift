//
//  UnitValueFormatter.swift
//  ChartRocks
//
//  Created by João Souza on 11/10/2017.
//  Copyright © 2017 João Marcelo Souza. All rights reserved.
//

import Charts
import Foundation

class UnitValueFormatter: NSObject, IAxisValueFormatter {
    
    let formatter: NumberFormatter
    let leftSymbol: String
    let rightSymbol: String

    init(leftSymbol: String = "", rightSymbol: String = "") {
        self.leftSymbol = leftSymbol
        self.rightSymbol = rightSymbol
        formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 1
    }

    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        let formattedValue = formatter.string(from: NSNumber(floatLiteral: value)) ?? ""
        let finalString = [leftSymbol, formattedValue, rightSymbol].filter { !$0.isEmpty }.joined(separator: " ")
        return finalString
    }
}
