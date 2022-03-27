//
//  SecondaryFormTableViewController.swift
//  Futurance
//
//  Created by Braden Desman on 3/26/22.
//

import UIKit

class SecondaryFormTableViewController: UITableViewController, SecondaryCellDelegate, UITextFieldDelegate, ContinueCellDelegate {
    
    func continueButtonPressed() {
        print("continued")
        performSegue(withIdentifier: "exitForms", sender: nil)
    }
    
    
    func store(_ type: User.GoalType, savingsValue: Float) {
        savings[type] = savingsValue
        let continueCell = tableView(tableView, cellForRowAt: IndexPath(row: 0, section: goals!.count)) as! ContinueTableViewCell
        print("stored")
        if savings.count == goals.count {
            print("here")
            continueCell.continueButton.isEnabled = true
            tableView.reloadRows(at: [IndexPath(row: 0, section: goals.count)], with: .fade)
        }
    }
    
    var user: User!
    var goals: [User.GoalType]!
    var savings: [User.GoalType : Float] = [:]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let user = user else {return}
        let continueCell = tableView(tableView, cellForRowAt: IndexPath(row: 0, section: goals!.count)) as! ContinueTableViewCell
        continueCell.continueButton.isEnabled = false
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        guard let goals = goals else {return 0}
        return goals.count + 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        false
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section < goals!.count {
            let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell", for: indexPath) as! SecondaryTableViewCell
            guard let goals = goals else {
                return cell
            }

            cell.cellTitle.text = goals[indexPath.section].rawValue
            if goals[indexPath.section].rawValue == "Student Loan" {
                cell.cellSubtitle.text = "Enter the amount of your loan yet to be repaid."
            } else {
                cell.cellSubtitle.text = "Enter an estimated target savings value"
            }
            
            cell.cellType = goals[indexPath.section]
            cell.delegate = self
            cell.cellTextfield.delegate = self
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "continueCell", for: indexPath) as! ContinueTableViewCell
            cell.delegate = self
            if goals.count == savings.count {
                cell.continueButton.isEnabled = true
            }
            return cell
        }
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
