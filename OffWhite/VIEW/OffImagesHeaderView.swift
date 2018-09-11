//
//  OffImagesHeaderView.swift
//  OffWhite
//
//  Created by Faishal Alif on 8/5/18.
//  Copyright © 2018 Faishal Alif. All rights reserved.
//

import UIKit

class OffImagesHeaderView: UIView
{
 @IBOutlet weak var pageControl: UIPageControl!
}
    extension OffImagesHeaderView : OffImagesPageViewControllerDelegate
    {
        func setupPageController(numberOfPages: Int)
        {
            pageControl.numberOfPages = numberOfPages
        }
        
        func turnPageController(to index: Int)
        {
            pageControl.currentPage = index
        }
}
