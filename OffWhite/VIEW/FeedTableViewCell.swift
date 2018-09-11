//
//  FeedTableViewCell.swift
//  OffWhite
//
//  Created by Faishal Alif on 8/5/18.
//  Copyright © 2018 Faishal Alif. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell {

    
    @IBOutlet weak var offImageView: UIImageView!
    @IBOutlet weak var offNameLabel: UILabel!
    @IBOutlet weak var offPriceLabel: UILabel!
    
    
    var off: Off! {
        didSet {
            self.updateUI()
        }
    }
    
    func updateUI()
    {
        offImageView.image = off.images?.first
        offNameLabel.text = off.name
        if let price = off.price {
            offPriceLabel.text = "$\(price)"
        } else {
            offPriceLabel.text = ""
        }
    }

}
