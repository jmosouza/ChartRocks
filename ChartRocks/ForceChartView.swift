//
//  DynamicChart.swift
//  ChartRocks
//
//  Created by João Souza on 14/10/2017.
//  Copyright © 2017 João Marcelo Souza. All rights reserved.
//

import Charts

class ForceChartView: LineChartView {
    
    /// Chart is just syntatic sugar to `self`.
    var chart: LineChartView {
        return self
    }
    
    override func didMoveToWindow() {
        super.didMoveToWindow()

        // Configure empty dataset
        let dataSet = LineChartDataSet()
        dataSet.lineWidth = 2
        dataSet.drawValuesEnabled = false
        dataSet.drawCirclesEnabled = false
        let lineData = LineChartData(dataSet: dataSet)
        chart.data = lineData

        // Configure styles
        chart.drawMarkers = false
        chart.drawGridBackgroundEnabled = false
        chart.chartDescription = nil
        chart.legend.enabled = false
        chart.xAxis.axisMinimum = 0
        chart.xAxis.axisMaximum = 5
        chart.xAxis.granularity = 1
        // chart.xAxis.drawLabelsEnabled = false
        chart.xAxis.drawGridLinesEnabled = false
        chart.leftAxis.axisMinimum = 0
        chart.leftAxis.axisMaximum = 50
        chart.leftAxis.valueFormatter = UnitValueFormatter(rightSymbol: "kg")
        chart.rightAxis.enabled = false
    }
    
    func append(x: Double, y: Double) {
        let entry = ChartDataEntry(x: x, y: y)
        chart.data?.addEntry(entry, dataSetIndex: 0)
        chart.notifyDataSetChanged()
        
        // NOT WORKING: Scroll to (x - 5)
        chart.moveViewToX(x - 5)
    }
    
}
