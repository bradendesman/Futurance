//
//  ContinueTableViewCell.swift
//  Futurance
//
//  Created by Braden Desman on 3/26/22.
//

import UIKit

protocol ContinueCellDelegate {
    func continueButtonPressed()
}
class ContinueTableViewCell: UITableViewCell {

    @IBOutlet var continueButton: UIButton!
    var delegate: ContinueCellDelegate!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func continueButtonPressed(_ sender: Any) {
        delegate.continueButtonPressed()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
