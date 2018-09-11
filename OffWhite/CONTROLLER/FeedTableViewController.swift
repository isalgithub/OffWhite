//
//  FeedTableViewController.swift
//  OffWhite
//
//  Created by Faishal Alif on 8/5/18.
//  Copyright © 2018 Faishal Alif. All rights reserved.
//

import UIKit

class FeedTableViewController: UITableViewController {

    var offs: [Off]?
    
    struct Storyboard {
        static let feedOffCell = "FeedOffCell"
        static let showOffDetail = "ShowOffDetail"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "OFF-WHITE"
        
        offs = Off.fetchOffs()
        self.tableView.reloadData()
        
        self.tableView.estimatedRowHeight = tableView.rowHeight
        self.tableView.rowHeight = UITableViewAutomaticDimension
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Storyboard.showOffDetail {
            if let offDetailTVC = segue.destination as? OffDetailTableViewController {
                let selectedOff = self.offs?[(sender as! IndexPath).row]
                offDetailTVC.off = selectedOff
            }
        }
    }
    
   
    
    
}

// MARK - UITableViewDataSource

extension FeedTableViewController
{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let offs = offs {
            return offs.count
        } else {
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.feedOffCell, for: indexPath) as! FeedTableViewCell
        
        cell.off = self.offs?[indexPath.row]
        cell.selectionStyle = .none
        
        return cell
    }
    
}


// MARK: - UITableViewDelegate
// buat ngarhn ke detail

extension FeedTableViewController
{
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: Storyboard.showOffDetail, sender: indexPath)
    }
}






