//
//  ProfileTableViewController.swift
//  OffWhite
//
//  Created by Faishal Alif on 8/8/18.
//  Copyright © 2018 Faishal Alif. All rights reserved.
//

import UIKit

class ProfileTableViewController: UITableViewController
{
    lazy var accountLines: [AccountLine] = {
        return AccountLine.accountLines()
    }()
    
    // MARK: - VC Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Make the row height dynamic
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    // MARK: - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let accountLine = accountLines[section]
        return accountLine.name
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return accountLines.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let accountLine = accountLines[section]
        return accountLine.products.count   // the number of products in the section
    }
    
    // indexPath: which section and which row
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Account Cell", for: indexPath) as! ProductTableViewCell
        
        let accountLine = accountLines[indexPath.section]
        let account = accountLine.products[indexPath.row]
        
        cell.configureCellWith(account)
        
        return cell
    }
    
    // MARK: - Edit Tableview
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            let accountLine = accountLines[indexPath.section]
            accountLine.products.remove(at: indexPath.row)
            // tell the table view to update with new data source
            // tableView.reloadData()    Bad way!
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
        }
    }
    
    // MARK: - Moving Cells
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath)
    {
        let accountToMove = accountLines[sourceIndexPath.section].products[sourceIndexPath.row]
        
        // move targetedProduct to toProducts
        accountLines[destinationIndexPath.section].products.insert(accountToMove, at: destinationIndexPath.row)
        
        // delete the targetedProduct to fromProducts
        accountLines[sourceIndexPath.section].products.remove(at: sourceIndexPath.row)
    }
    
    
    
    
    
    // MARK: - Helper Method
    
    func productAtIndexPath(_ indexPath: IndexPath) -> Product
    {
        let productLine = accountLines[indexPath.section]
        return productLine.products[indexPath.row]
    }
    
}

