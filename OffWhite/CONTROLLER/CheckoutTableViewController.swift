//
//  CheckoutTableViewController.swift
//  OffWhite
//
//  Created by Faishal Alif on 8/6/18.
//  Copyright © 2018 Faishal Alif. All rights reserved.
//

import UIKit

class ShoppingBagTableViewController: UITableViewController
{
    struct Storyboard {
        static let numberOfItemsCell = "numberOfItemsCell"      // cell 0
        static let itemCell = "itemCell"                        // cell 1
        static let cartDetailCell = "cartDetailCell"            // cell 2
        static let cartTotalCell = "cartTotalCell"              // cell 3
        static let checkoutButtonCell = "checkoutButtonCell"    // cell 4
    }
    
    var offs: [Off]? = Off.fetchOffs()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
    }
}

extension ShoppingBagTableViewController
{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let offs = offs {
            return offs.count + 4
        } else {
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        guard let offs = offs else {
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.numberOfItemsCell, for: indexPath) as! NumberOfItemsCell
            cell.numberOfItemsLabel.text = "\(0) ITEM"
            
            return cell
        }
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.numberOfItemsCell, for: indexPath) as! NumberOfItemsCell
            cell.numberOfItemsLabel.text = "\(offs.count) ITEMS"
            return cell
        } else if indexPath.row == offs.count + 1 {
            // cartDetailCell
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.cartDetailCell, for: indexPath)
            
            return cell
        } else if indexPath.row == offs.count + 2 {
            // cartTotalCell
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.cartTotalCell, for: indexPath)
            
            return cell
        } else if indexPath.row == offs.count + 3 {
            // checkoutButtonCell
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.checkoutButtonCell, for: indexPath)
            
            return cell
        } else {
            // itemCell
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.itemCell, for: indexPath) as! ShoppingCartItemCell
            cell.off = offs[indexPath.row - 1]
            return cell
        }
    }
}

class NumberOfItemsCell: UITableViewCell
{
    @IBOutlet weak var numberOfItemsLabel: UILabel!
}

class ShoppingCartItemCell : UITableViewCell
{
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var removeButton: UIButton!
    
    var off: Off! {
        didSet {
            self.updateUI()
        }
    }
    
    func updateUI()
    {
        productImageView.image = off.images?.first
        productNameLabel.text = off.name
        productPriceLabel.text = "$\(off.price!)"
    }
    
    @IBAction func removeButtonDidTap(_ sender: Any) {
       
    }
}
