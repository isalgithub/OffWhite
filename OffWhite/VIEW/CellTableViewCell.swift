//
//  CellTableViewCell.swift
//  OffWhite
//
//  Created by Faishal Alif on 8/16/18.
//  Copyright © 2018 Faishal Alif. All rights reserved.
//

import UIKit

class CellTableViewCell: UITableViewCell {

    
    @IBOutlet weak var img: UIImageView!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
