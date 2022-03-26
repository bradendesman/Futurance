//
//  User.swift
//  Futurance
//
//  Created by Braden Desman on 3/26/22.
//

import Foundation

struct User {
    //Page 1: Info
    let firstName: String
    let lastName: String
    var Age: Int
    let email: String
    
    //Page 2: Life Situation
    enum WorkStatusType {
        case partTime, fullTime, student
    }
    
    var workStatus: [WorkStatusType]
    
    //Page 3: Investing goals
    enum GoalType {
        case studentLoans, saveForHome, saveForRetirement
    }
    
    var studentLoanDebtRemaining: Double?
    
    var investingGoals: [GoalType]
    
    //Page 4: Risk Tolerance
    enum ToleranceLevel {
        case low, medium, high
    }
    
    var riskTolerance: ToleranceLevel
    
    //Page 5: Timeline
    var endDate: Date
    
    //Page 6: Types of Investments and Priorities
    enum InvestmentModes {
        case stocks, bonds, ETFs, crypto
    }
    
    enum InvestmentPriorities {
        case ESG
    }
    
    var investmentModes: [InvestmentModes]
    var investmentPriorities: [InvestmentPriorities]
}
