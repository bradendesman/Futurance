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
    @IBOutlet var welcomeLabel: UILabel!
    var savings: [User.GoalType : Float]!
    var networth:Float = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = ""
        welcomeLabel.text = "Welcome, \(user.firstName)"
        // Do any additional setup after loading the view.
        
        view.addSubview(lineChartView)
        lineChartView.centerInSuperview()
        lineChartView.width(to: view, offset: -30)
        lineChartView.heightToWidth(of: view, offset: -20)
        lineChartView.layer.cornerRadius = 30
        lineChartView.clipsToBounds = true
        lineChartView.alpha = 0
        assets()
        projectedReturns()
       // dataPoints()
        setData()
    }
        
        
    override func viewDidAppear(_ animated: Bool) {
        Task {
            await delay()
            UIView.transition(with: welcomeLabel, duration: 1, options: .curveEaseIn, animations: {
                self.welcomeLabel.frame.origin.y -= 600}, completion: {_ in
                    self.navigationItem.title = "Status"
                    UIView.transition(with: self.lineChartView, duration: 0.2, animations: {
                        self.lineChartView.alpha = 1
                    })
                })
        }
        
    }
    func delay() async {
        let seconds = Double(1)
        await Task.sleep(UInt64(seconds * Double(NSEC_PER_SEC)))
    }
    
    //MARK: Making the graph
    
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
            percent = 1.14
        case .medium:
            percent = 1.08
        case .low:
            percent = 1.04
        default:
            percent = 1.04
        }
        var years = 65 - user.age
        var data: [Float] = [networth]
        
    func dataPoints(){
        for i in 1...years {
            let x = data[0]
            //var point = pow(x, Float(i))
            var point = x * Float(percent) * Float(i)
            point.round(.down)
            data.append(point)
            xy.append(ChartDataEntry(x:Double(i), y: Double(point)))
        }
    }
    dataPoints()
}
    lazy var lineChartView: LineChartView = {
        let chartView = LineChartView()
        chartView.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.05)
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
}
