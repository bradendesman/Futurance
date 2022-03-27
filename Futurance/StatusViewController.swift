//
//  StatusViewController.swift
//  Futurance
//
//  Created by Braden Desman on 3/26/22.
//

import UIKit
import Foundation
import Charts
import TinyConstraints

class StatusViewController:
    UIViewController, ChartViewDelegate {
    
    var user: User!
    var savings: [User.GoalType : Float]!
    var networth:Float = 0.0
    func assets(){
        for (type,value) in savings{
            if (type == User.GoalType.studentLoans){
            networth += -1 * savings[type]!
            }   else{
                networth += value
            }
        }
    }
    var percent = 0.00
    func projectedReturns(){
        switch user.riskTolerance{
        case .high:
            percent = 14.00
        case .medium:
            percent = 8.00
        case .low:
            percent = 4.00
        default:
            percent = 4.00
        }
        var years = 65 - user.age
        var data: [Float] = [networth]
        
    func dataPoints(){
        for i in 1...years {
            let x = (data[0] * Float((1.00 + percent/100.0)))
            var point = pow(x, Float(i))
            data.append(point)
            xy.append(ChartDataEntry(x:Double(i), y: Double(point)))
        }
    }
    dataPoints()
}
    lazy var lineChartView: LineChartView = {
        let chartView = LineChartView()
        chartView.backgroundColor = .systemBlue
        return chartView
    }()
    var xy: [ChartDataEntry] = []
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        print(entry)
    }
    func setData(){
        print("Joe")
        print(xy)
        let set1 = LineChartDataSet(entries: xy, label: "Projected Growth")
        let data = LineChartData(dataSet: set1)
        lineChartView.data = data
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(lineChartView)
        lineChartView.centerInSuperview()
        lineChartView.width(to: view)
        lineChartView.heightToWidth(of: view)
        assets()
        projectedReturns()
       // dataPoints()
        setData()
    }
}
