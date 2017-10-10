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
        
        // TO SEE CRASH:
        // Comment `setupStaticChart()` and uncomment `setupDynamicChart()` below.
        
        // Static chart works fine
        setupStaticChart()
        
        // (!) Dynamic chart crashes
        //setupDynamicChart()
    }
    
    func setupStaticChart() {
        var dataEntries = [ChartDataEntry]()
        for i in 1...10 {
            let entry = ChartDataEntry(x: Double(i), y: Double(arc4random()))
            dataEntries.append(entry)
        }
        let dataSet = LineChartDataSet(values: dataEntries, label: "Random Value")
        let lineData = LineChartData(dataSet: dataSet)
        chart.data = lineData
        setupChartViewport()
    }
    
    func setupDynamicChart() {
        offset = Date.timeIntervalSinceReferenceDate
        let dataSet = LineChartDataSet(values: [], label: "Random Value")
        let lineData = LineChartData(dataSet: dataSet)
        chart.data = lineData
        setupChartViewport()
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (_) in
            self.addRandomData()
        })
    }
    
    func addRandomData() {
        let entry = ChartDataEntry(x: Date.timeIntervalSinceReferenceDate - offset, y: Double(arc4random()))
        chart.data?.addEntry(entry, dataSetIndex: 0)
        chart.notifyDataSetChanged()
    }
    
    func setupChartViewport() {
        // On dynamic chart, this shows nothing:
         chart.moveViewToX(0)
        
        // On dynamic chart, this crashes:
         chart.setVisibleXRangeMaximum(4)
    }

}

