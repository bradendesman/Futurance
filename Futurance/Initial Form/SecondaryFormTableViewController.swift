//
//  SecondaryFormTableViewController.swift
//  Futurance
//
//  Created by Braden Desman on 3/26/22.
//

import UIKit

class SecondaryFormTableViewController: UITableViewController, SecondaryCellDelegate, UITextFieldDelegate, ContinueCellDelegate {
    
    func continueButtonPressed() {
        saveUserAndSavings()
        performSegue(withIdentifier: "exitForms", sender: nil)
    }
    
    func saveUserAndSavings() {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let archiveURL = documentsDirectory.appendingPathComponent("userData").appendingPathExtension("plist")
        let propertylistEnoder = PropertyListEncoder()
        if let encodedUser = try? propertylistEnoder.encode(user) {
            try? encodedUser.write(to: archiveURL, options: .noFileProtection)
        }
        
        let savingsArchiveURL = documentsDirectory.appendingPathComponent("savingsData").appendingPathExtension("plist")
        if let encodedSavings = try? propertylistEnoder.encode(savings) {
            try? encodedSavings.write(to:savingsArchiveURL, options: .noFileProtection)
        }
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "subsequentExits" {
            let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            let archiveURL = documentsDirectory.appendingPathComponent("userData").appendingPathExtension("plist")
            let savingsArchiveURL = documentsDirectory.appendingPathComponent("savingsData").appendingPathExtension("plist")
            
            let propertyListDecoder = PropertyListDecoder()
            guard let retrievedUserData = try? Data(contentsOf: archiveURL), let decodedUser = try? propertyListDecoder.decode(User.self, from: retrievedUserData) else {return}
            guard let retrievedSavingsData = try? Data(contentsOf: savingsArchiveURL), let decodedSavings = try? propertyListDecoder.decode([User.GoalType : Float].self, from: retrievedSavingsData) else {return}
            
            let tabBar = segue.destination as! MyTabBarController
            let nav = tabBar.viewControllers![0] as! UINavigationController
            let destination = nav.viewControllers.first! as! StatusViewController
            destination.user = decodedUser
            destination.savings = decodedSavings
            
        } else {
            let tabBar = segue.destination as! MyTabBarController
            let nav = tabBar.viewControllers![0] as! UINavigationController
            let destination = nav.viewControllers.first! as! StatusViewController
            destination.user = user
            destination.savings = savings
        }
    }
    
    
    func store(_ type: User.GoalType, savingsValue: Float) {
        savings[type] = savingsValue
        let continueCell = tableView(tableView, cellForRowAt: IndexPath(row: 0, section: goals!.count)) as! ContinueTableViewCell
        if savings.count == goals.count {
            continueCell.continueButton.isEnabled = true
            tableView.reloadRows(at: [IndexPath(row: 0, section: goals.count)], with: .fade)
        }
    }
    
    let defaults = UserDefaults.standard
    var user: User!
    var goals: [User.GoalType]!
    var savings: [User.GoalType : Float] = [:]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
