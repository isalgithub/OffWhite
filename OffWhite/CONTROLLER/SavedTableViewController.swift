//
//  SavedTableViewController.swift
//  OffWhite
//
//  Created by Faishal Alif on 8/8/18.
//  Copyright © 2018 Faishal Alif. All rights reserved.
//

import UIKit

class SavedTableViewController: UITableViewController
{
    lazy var savedLines: [SavedLine] = {
        return SavedLine.savedLines()
    }()
    
    // MARK: - VC Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = editButtonItem
        
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
        let savedLine = savedLines[section]
        return savedLine.name
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return savedLines.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let savedLine = savedLines[section]
        return savedLine.saveds.count   // the number of products in the section
    }
    
    // indexPath: which section and which row
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Saved Cell", for: indexPath) as! SavedTableViewCell
        
        let savedLine = savedLines[indexPath.section]
         let saved = savedLine.saveds[indexPath.row]
        
        cell.configureCellWith(saved)
        
        return cell
    }
    
    // MARK: - Edit Tableview
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            let savedLine = savedLines[indexPath.section]
            savedLine.saveds.remove(at: indexPath.row)
            // tell the table view to update with new data source
            // tableView.reloadData()    Bad way!
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
        }
    }
    
    // MARK: - Moving Cells
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath)
    {
        let savedToMove = savedLines[sourceIndexPath.section].saveds[sourceIndexPath.row]
        
        // move targetedProduct to toProducts
        savedLines[destinationIndexPath.section].saveds.insert(savedToMove, at: destinationIndexPath.row)
        
        // delete the targetedProduct to fromProducts
        savedLines[sourceIndexPath.section].saveds.remove(at: sourceIndexPath.row)
    }
    
    
    
    
    
    // MARK: - Helper Method
    
    func savedAtIndexPath(_ indexPath: IndexPath) -> Saved
    {
        let savedLine = savedLines[indexPath.section]
        return savedLine.saveds[indexPath.row]
    }
    
}
