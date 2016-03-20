//
//  AccountDetailTableViewCell.swift
//  CMP_0.0
//
//  Created by Akshay's on 3/19/16.
//  Copyright © 2016 Akshay's. All rights reserved.
//

import UIKit

class AccountDetailTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var accountDetailLabel: UILabel!

    @IBOutlet weak var accountDetailName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
