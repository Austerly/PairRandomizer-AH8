//
//  DoubleButtonTableViewCell.swift
//  PairRandomizer
//
//  Created by Taylor Mott on 9/6/16.
//  Copyright © 2016 Mott Applications. All rights reserved.
//

import UIKit

protocol DoubleButtonTableViewCellDelegate: class {
    func doubleButtonTableViewCell(cell: DoubleButtonTableViewCell, buttonTapped: DoubleButtonTableViewCell.Button)
}

class DoubleButtonTableViewCell: UITableViewCell {
    
    enum Button {
        case Left
        case Right
    }
    
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    weak var delegate: DoubleButtonTableViewCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func cellButtonTapped(sender: UIButton) {
        if sender == leftButton {
            delegate?.doubleButtonTableViewCell(self, buttonTapped: .Left)
        } else if sender == rightButton {
            delegate?.doubleButtonTableViewCell(self, buttonTapped: .Right)
        }
    }
    
    

}
