//
//  OffDetailCell.swift
//  OffWhite
//
//  Created by Faishal Alif on 8/5/18.
//  Copyright © 2018 Faishal Alif. All rights reserved.
//

import UIKit

class OffDetailCell : UITableViewCell

{
    
    @IBOutlet weak var offNameLabel: UILabel!
    @IBOutlet weak var offDescriptionLabel: UILabel!
    
    var off: Off! {
        didSet {
            self.updateUI()
        }
    }
    
    func updateUI()
    {
        offNameLabel.text = off.name
        offDescriptionLabel.text = off.description
    }
    
    
    
}
