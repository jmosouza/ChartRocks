//
//  ViewController.swift
//  ChartRocks
//
//  Created by João Souza on 08/10/2017.
//  Copyright © 2017 João Marcelo Souza. All rights reserved.
//

import Charts
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var chart: LineChartView!
    var timer: Timer!
    var offset: TimeInterval!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDynamicChart()
    }
    
    func setupDynamicChart() {
        offset = Date.timeIntervalSinceReferenceDate
        let dataSet = LineChartDataSet(values: [], label: "Membro dominante")
        dataSet.lineWidth = 2
        dataSet.drawValuesEnabled = false
        dataSet.drawCirclesEnabled = false
        let lineData = LineChartData(dataSet: dataSet)
        chart.data = lineData

        // Style adjustments
        chart.drawMarkers = false
        chart.drawGridBackgroundEnabled = false
        chart.chartDescription = nil
        chart.xAxis.axisMinimum = 0
        chart.xAxis.axisMaximum = 5
        chart.xAxis.granularity = 1
        chart.xAxis.drawGridLinesEnabled = false
        chart.xAxis.valueFormatter = UnitValueFormatter(rightSymbol: "s")
        chart.leftAxis.axisMinimum = 0
        chart.leftAxis.axisMaximum = 50
        chart.leftAxis.valueFormatter = UnitValueFormatter(rightSymbol: "kg")
        chart.rightAxis.enabled = false
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true, block: { (_) in
            self.addRandomData()
        })
    }
    
    func addRandomData() {
        let entry = ChartDataEntry(
            x: Date.timeIntervalSinceReferenceDate - offset,
            y: Double(arc4random() / 100_000_000)
        )
        chart.data?.addEntry(entry, dataSetIndex: 0)
        chart.notifyDataSetChanged()
    }

}

