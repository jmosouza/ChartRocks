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

        // Fill the first range of 5 in X axis.
        let entry1 = ChartDataEntry(x: 0, y: 0)
        let entry2 = ChartDataEntry(x: 5, y: 0)
        let dataSet = LineChartDataSet(values: [entry1, entry2], label: nil)
        
        // Configure and add the data set.
        dataSet.lineWidth = 2
        dataSet.drawValuesEnabled = false
        dataSet.drawCirclesEnabled = false
        let lineData = LineChartData(dataSet: dataSet)
        chart.data = lineData

        // Configure styles
        chart.drawMarkers = false
        chart.chartDescription = nil
        chart.drawGridBackgroundEnabled = false
        chart.legend.enabled = false
        chart.xAxis.granularity = 1
        chart.xAxis.drawLabelsEnabled = false
        chart.xAxis.drawGridLinesEnabled = false
        chart.leftAxis.axisMinimum = 0
        chart.leftAxis.axisMaximum = 100
        chart.leftAxis.valueFormatter = UnitValueFormatter(rightSymbol: "kg")
        chart.rightAxis.enabled = false
    }
    
    func append(x: Double, y: Double) {
        let entry = ChartDataEntry(x: x + 5, y: y)
        chart.data?.addEntry(entry, dataSetIndex: 0)
        chart.notifyDataSetChanged()
        
        // Scroll to end of chart.
        chart.moveViewToX(x)
        chart.setVisibleXRangeMaximum(5)
        chart.setVisibleXRangeMinimum(5)
    }
    
}
