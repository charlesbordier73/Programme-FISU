//
//  AccueilTableViewCell.swift
//  Programme FISU
//
//  Created by arthur jamelot on 04/04/2016.
//  Copyright © 2016 Charles. All rights reserved.
//

import UIKit

class AccueilTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {

        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBOutlet weak var dateActivite: UILabel!
    @IBOutlet weak var nomActivite: UILabel!
    @IBAction func selectionActivite(sender: UISwitch) {
    }
    
}
