//
//  User.swift
//  Futurance
//
//  Created by Braden Desman on 3/26/22.
//

import Foundation

struct User: Codable {
    //Page 1: Info
    let firstName: String
    let lastName: String
    var age: Int
    let email: String
    
    //Page 2: Life Situation
    public enum WorkStatusType: Codable {
        case partTime, fullTime, student
    }
    
    var workStatus: [WorkStatusType]
    
    //Page 3: Investing goals
    public enum GoalType: String, Codable {
        case studentLoans = "Student Loan"
        case saveForHome = "Home Savings"
        case saveForRetirement = "Retirement Savings"
        case saveForCar = "Car Savings"
    }
    
    var studentLoanDebtRemaining: Double?
    
    var investingGoals: [GoalType]
    
    //Page 4: Risk Tolerance
    public enum ToleranceLevel: Codable {
        case low, medium, high
    }
    
    var riskTolerance: ToleranceLevel
    
    //Page 5: Timeline
//    var endDate: Date
    
    //Page 6: Types of Investments and Priorities
    public enum InvestmentModes: Codable {
        case stocks, bonds, ETFs, crypto
    }
    
    var investmentModes: [InvestmentModes]
//    var investmentPriorities: [InvestmentPriorities]
}
