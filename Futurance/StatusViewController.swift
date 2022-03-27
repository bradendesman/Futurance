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

class StatusViewController: UIViewController {

    var user: User!
    var savings: [User.GoalType : Float]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
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
        }
    }
    
   
}

}
