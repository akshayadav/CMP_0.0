//
//  restaurantTableViewCell.swift
//  CMP_0.0
//
//  Created by Akshay's on 3/15/16.
//  Copyright © 2016 Akshay's. All rights reserved.
//

import UIKit

class restaurantTableViewCell: UITableViewCell {
    
    // MARK: Properties
    @IBOutlet weak var restaurantName: UILabel!
    @IBOutlet weak var restaurantImage: UIImageView!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
