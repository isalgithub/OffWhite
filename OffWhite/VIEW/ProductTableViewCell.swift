//
//  ProductTableViewCell.swift
//  OffWhite
//
//  Created by Faishal Alif on 8/8/18.
//  Copyright © 2018 Faishal Alif. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    
    @IBOutlet weak var productDescriptionLabel: UILabel!
    
    @IBOutlet weak var productTitleLabel: UILabel!
    
    
    
    
    
    
    
    func configureCellWith(_ product: Product)
    {
       
        productDescriptionLabel.text = product.description
        productTitleLabel.text = product.title
    }
}
