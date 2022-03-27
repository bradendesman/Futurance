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
    }
        view.addSubview(lineChartView)
        lineChartView.centerInSuperview()
        lineChartView.width(to: view)
        lineChartView.heightToWidth(of: view)
        assets()
        projectedReturns()
       // dataPoints()
        setData()
        
    override func viewDidAppear(_ animated: Bool) {
        Task {
            await delay()
            UIView.transition(with: welcomeLabel, duration: 1, options: .curveEaseIn, animations: {
                self.welcomeLabel.frame.origin.y -= 600}, completion: {_ in
                    self.navigationItem.title = "Status"
                })
        }
        
    }
    func delay() async {
        let seconds = Double(1)
        await Task.sleep(UInt64(seconds * Double(NSEC_PER_SEC)))
    }
    
    //MARK: Making the graph
}
