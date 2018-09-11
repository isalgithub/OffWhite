//
//  OffDetailTableViewController.swift
//  OffWhite
//
//  Created by Faishal Alif on 8/5/18.
//  Copyright © 2018 Faishal Alif. All rights reserved.
//

import UIKit

class OffDetailTableViewController: UITableViewController {
    
    var off: Off!
    var myIndex = 0

    @IBOutlet weak var offImagesHeaderView: OffImagesHeaderView!
    
    @IBAction func btnAddToBag(_ sender: Any) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = off.name
        
        self.tableView.estimatedRowHeight = self.tableView.rowHeight
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        self.tabBarController?.tabBar.items![1].badgeValue = "2"
    }
    
    struct Storyboard {
        static let showImagesPageVC = "ShowImagesPageViewController"
        static let offDetailCell = "OffDetailCell"
        static let productDetailCell = "ProductDetailsCell"
        static let suggestionCell = "SuggestionCell"
        static let buyButtonCell = "BuyButtonCell"
    }
    
    // MARK : - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Storyboard.showImagesPageVC {
            if let imagesPageVC = segue.destination as? OffImagesPageViewController {
                imagesPageVC.images = off.images
                imagesPageVC.pageViewControllerDelegate = offImagesHeaderView
            }
        }
    }
}

extension OffDetailTableViewController
{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 0 - shoe detail cell
        // 1 - buy button
        // 2 - shoe full details button cell
        // 3 - you might like this cell
        return 4
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.offDetailCell, for: indexPath) as! OffDetailCell
            cell.off = off
            cell.selectionStyle = .none
            
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.buyButtonCell, for: indexPath)
            
            return cell
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.productDetailCell, for: indexPath)
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.suggestionCell, for: indexPath) as! SuggestionTableViewCell
            
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
    {
        if indexPath.row == 3 {
            if let cell = cell as? SuggestionTableViewCell {
                cell.collectionView.dataSource = self
                cell.collectionView.delegate = self
                cell.collectionView.reloadData()
                cell.collectionView.isScrollEnabled = false
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 3 {
            return self.tableView.bounds.width + 68
        } else {
            return UITableViewAutomaticDimension
        }
    }
}

// MARK: - UICollectionViewDataSource

extension OffDetailTableViewController: UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.suggestionCell, for: indexPath) as! SuggestionCollectionViewCell
        let offs = Off.fetchOffs()
        cell.image = offs[indexPath.item].images?.first
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderColor = UIColor.gray.cgColor
        cell?.layer.borderWidth = 2
        
        
        
       
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
       let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderColor = UIColor.lightGray.cgColor
        cell?.layer.borderWidth = 0.5
    }
}




extension OffDetailTableViewController : UICollectionViewDelegate, UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumLineSpacing = 5.0
        layout.minimumInteritemSpacing = 2.5
        let itemWidth = (collectionView.bounds.width - 5.0) / 2.0
        return CGSize(width: itemWidth, height: itemWidth)
    }
    
    
    
}
