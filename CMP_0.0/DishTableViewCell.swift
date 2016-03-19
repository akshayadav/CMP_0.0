//
//  DishTableViewCell.swift
//  CMP_0.0
//
//  Created by Akshay's on 3/19/16.
//  Copyright © 2016 Akshay's. All rights reserved.
//

import UIKit

class DishTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var dishName: UILabel!
    
    @IBOutlet weak var ingredientsText: UILabel!
    
    @IBOutlet weak var dishImage: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
