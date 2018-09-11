//
//  FeedCategoryViewController.swift
//  OffWhite
//
//  Created by Faishal Alif on 8/20/18.
//  Copyright © 2018 Faishal Alif. All rights reserved.
//

import UIKit

var img = [UIImage(named: "bags1"), UIImage(named: "bags2"), UIImage(named: "bags3"), UIImage(named: "bags4")]

var nameLabel = ["tas1","tas2", "tas3", "tas4"]

var priceLabel = ["100", "200", "300", "400"]

var myIndex = 0



class FeedCategoryViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}

extension FeedCategoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 360
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return img.count
        
    }
    
    // manggil gambar buat nampilin ke feed
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? FeedCategoryTableViewCell
        cell?.categoryImageView.image = img[indexPath.row]
        cell?.categoryNameLabel.text = nameLabel[indexPath.row]
        cell?.categoryPriceLabel.text = priceLabel[indexPath.row]
        
        
        return cell!
    }
    
    // connect
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
        performSegue(withIdentifier: "segue", sender: self)
    }
    
}
