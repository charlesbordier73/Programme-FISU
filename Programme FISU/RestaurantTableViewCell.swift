//
//  RestaurantTableViewCell.swift
//  Programme FISU
//
//  Created by arthur jamelot on 06/04/2016.
//  Copyright © 2016 Charles. All rights reserved.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {

    @IBOutlet weak var heureDebRestaurant: UILabel!
    @IBOutlet weak var nomRestaurant: UILabel!
    @IBOutlet weak var heureFinRestaurant: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
