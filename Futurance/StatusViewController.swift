//
//  StatusViewController.swift
//  Futurance
//
//  Created by Braden Desman on 3/26/22.
//

import UIKit

class StatusViewController: UIViewController {

    var user: User!
    @IBOutlet var welcomeLabel: UILabel!
    var savings: [User.GoalType : Float]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = ""
        welcomeLabel.text = "Welcome, \(user.firstName)"
        // Do any additional setup after loading the view.
    }
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
