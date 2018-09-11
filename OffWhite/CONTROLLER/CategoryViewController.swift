//
//  CategoryViewController.swift
//  OffWhite
//
//  Created by Faishal Alif on 8/16/18.
//  Copyright © 2018 Faishal Alif. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {
    
    var name = ["Tees", "Shoes", "Shirt", "Special Edition", "Accecories"]

    var images = [UIImage(named: "1"),
                  UIImage(named: "2"),
                  UIImage(named: "3"),
                  UIImage(named: "4"),
                  UIImage(named: "5"),]
    
    var myIndex = 0
                  
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
extension CategoryViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return name.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CellTableViewCell
        cell?.img.image = images[indexPath.row]
        
        return cell!
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
        performSegue(withIdentifier: "segue", sender: self)
    }
    
    
}
