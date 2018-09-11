//
//  FeedCategoryTableViewCell.swift
//  OffWhite
//
//  Created by Faishal Alif on 8/20/18.
//  Copyright © 2018 Faishal Alif. All rights reserved.
//

import UIKit

class FeedCategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryNameLabel: UILabel!
    @IBOutlet weak var categoryPriceLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
