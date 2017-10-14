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

    @IBOutlet weak var chart: ForceChartView!
    var timer: Timer!
    var offset: TimeInterval!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDynamicChart()
    }
    
    func setupDynamicChart() {
        offset = Date.timeIntervalSinceReferenceDate
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true, block: { (_) in
            let x = Date.timeIntervalSinceReferenceDate - self.offset
            let y = Double(arc4random() / 100_000_000)
            self.chart.append(x: x, y: y)
        })
    }

}

