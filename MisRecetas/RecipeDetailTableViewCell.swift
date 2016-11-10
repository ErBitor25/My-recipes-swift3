//
//  RecipeDetailTableViewCell.swift
//  MisRecetas
//
//  Created by Victor Guillen on 8/11/16.
//  Copyright © 2016 Victor Guillen. All rights reserved.
//

import UIKit

class RecipeDetailTableViewCell: UITableViewCell {

    @IBOutlet var keyLabel: UILabel!
    
    @IBOutlet var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
