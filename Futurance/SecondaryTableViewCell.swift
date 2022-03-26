//
//  SecondaryTableViewCell.swift
//  Futurance
//
//  Created by Braden Desman on 3/26/22.
//

import UIKit

protocol SecondaryCellDelegate {
    func store(_ type: User.GoalType, savingsValue: Float)
}
class SecondaryTableViewCell: UITableViewCell {

    @IBOutlet var cellTitle: UILabel!
    @IBOutlet var cellSubtitle: UILabel!
    @IBOutlet var cellTextfield: UITextField!
    var cellType: User.GoalType!
    var delegate: SecondaryCellDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func finishedEditing(_ sender: Any) {
        let savings = Float(cellTextfield.text ?? "0") ?? 0.0
        delegate.store(cellType, savingsValue: savings)
    }
    
}
