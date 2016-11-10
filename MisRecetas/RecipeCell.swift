//
//  RecipeCell.swift
//  MisRecetas
//
//  Created by Victor Guillen on 7/11/16.
//  Copyright © 2016 Victor Guillen. All rights reserved.
//

import UIKit

class RecipeCell: UITableViewCell {

    @IBOutlet var thumbnailImageView: UIImageView!
    
    @IBOutlet var nameLabel: UILabel!
    
    @IBOutlet var timeLabel: UILabel!
    
    @IBOutlet var ingredientsLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
