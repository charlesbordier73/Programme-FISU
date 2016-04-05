//
//  ProgTableViewCell.swift
//  Programme FISU
//
//  Created by arthur jamelot on 05/04/2016.
//  Copyright © 2016 Charles. All rights reserved.
//

import UIKit

class ProgTableViewCell: UITableViewCell {

    @IBOutlet weak var dateProg: UILabel!
    @IBOutlet weak var heureDebProg: UILabel!
    @IBOutlet weak var heureFinProg: UILabel!
    @IBOutlet weak var nomProg: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
