//
//  SavedTableViewCell.swift
//  OffWhite
//
//  Created by Faishal Alif on 8/8/18.
//  Copyright © 2018 Faishal Alif. All rights reserved.
//

import UIKit

class SavedTableViewCell: UITableViewCell {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var saveditemLabel: UILabel!
    @IBOutlet weak var totalitemLabel: UILabel!
    
    func configureCellWith(_ saved: Saved)
    {
        totalitemLabel.text = saved.title
        saveditemLabel.text = saved.description
        
    }
    
}
