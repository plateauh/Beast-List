//
//  CustomCell.swift
//  NajedBeastList
//
//  Created by Najd Alsughaiyer on 26/12/2021.
//

import UIKit

class CustomCell: UITableViewCell {
    
    var delegate: BeastCellDelegate?
    
    @IBAction func showButtonPressed(_ sender: UIButton) {
        delegate?.showTaskDescription(description: (self.textLabel?.text)!)
    }
    
}
