//
//  SingleButtonTableViewCell.swift
//  PairRandomizer
//
//  Created by Taylor Mott on 9/6/16.
//  Copyright © 2016 Mott Applications. All rights reserved.
//

import UIKit

protocol  SingleButtonTableViewCellDelegate: class {
    func singleButtonTableViewCellButtonTapped(cell: SingleButtonTableViewCell)
}

class SingleButtonTableViewCell: UITableViewCell {
    
    @IBOutlet weak var singleButton: UIButton!
    weak var delegate: SingleButtonTableViewCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func cellButtonTapped() {
        delegate?.singleButtonTableViewCellButtonTapped(self)
    }

}
