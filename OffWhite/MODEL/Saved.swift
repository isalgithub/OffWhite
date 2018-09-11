//
//  Saved.swift
//  OffWhite
//
//  Created by Faishal Alif on 8/8/18.
//  Copyright © 2018 Faishal Alif. All rights reserved.
//

import Foundation
import UIKit



// Represents a generic product. Need an image named "default"

class Saved
{
    var title: String
    var description: String
    var image: UIImage
    
    
    init(titled: String, description: String, imageName: String)
    {
        self.title = titled
        self.description = description
        if let img = UIImage(named: imageName) {
            image = img
        } else {
            image = UIImage(named: "b1")!
        }
        
        
    }
}
