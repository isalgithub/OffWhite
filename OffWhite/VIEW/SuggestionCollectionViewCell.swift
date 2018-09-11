//
//  SuggestionCollectionViewCell.swift
//  OffWhite
//
//  Created by Faishal Alif on 8/6/18.
//  Copyright © 2018 Faishal Alif. All rights reserved.
//

import UIKit

class SuggestionCollectionViewCell : UICollectionViewCell
{
    @IBOutlet weak var imageView: UIImageView!
    
    var image: UIImage! {
        didSet {
            self.imageView.image = image
            self.setNeedsLayout()
        }
        
    }
}
