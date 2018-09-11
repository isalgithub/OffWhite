//
//  Off.swift
//  OffWhite
//
//  Created by Faishal Alif on 8/5/18.
//  Copyright © 2018 Faishal Alif. All rights reserved.
//

import UIKit

class Off
{
    var uid: String?
    var name: String?
    var images: [UIImage]?
    var price: Double?
    var description: String?
    var detail: String?
    
    init(uid: String, name: String, images: [UIImage], price: Double, description: String, detail: String)
    {
        self.uid = uid
        self.name = name
        self.images = images
        self.price = price
        self.description = description
        self.detail = detail
    }
    
    class func fetchOffs() -> [Off]
    {
        var offs = [Off]()
        
        // 1
        var off1Images = [UIImage]()
        for i in 1...4 {
            off1Images.append(UIImage(named: "b\(i)")!)
        }
        let off1 = Off(uid: "875942-100", name: "BLACK ELEVATOR MUSIC BINDER CLIP", images: off1Images, price: 1222, description: "Canvas shoulder bag in black. Detachable shoulder strap with Off-White signature cut-out detailing. Closure with magnetic fastening. Silver binder clip attached at front. It comes with one black leather shoulder strap", detail: "70% Polyester 30% Polyamide")
        offs.append(off1)
        
        // 2
        var off2Images = [UIImage]()
        for i in 1...4 {
            off2Images.append(UIImage(named: "h\(i)")!)
        }
        let off2 = Off(uid: "875942-102", name: "BLACK WOMAN HOODIE", images: off2Images, price: 520, description: "Exclusive hoodie in collaboration with Galeries Lafayette", detail: "100% Cotton")
        offs.append(off2)
        
        
        // 3
        var off3Images = [UIImage]()
        for i in 1...3 {
            off3Images.append(UIImage(named: "m\(i)")!)
        }
        let off3 = Off(uid: "875942-103", name: "BLACK MONALISA CREWNECK", images: off3Images, price: 385, description: "Long sleeves Monalisa sweatshirt in black. White diagonals printed at sleeves and white arrows printed at back. Crewneck collar. Oversize fitting", detail: "100% Cotton")
        offs.append(off3)
        
        // 4
        var off4Images = [UIImage]()
        for i in 1...4 {
            off4Images.append(UIImage(named: "t\(i)")!)
        }
        let off4 = Off(uid: "875942-104", name: "TRANSPARENT LUGGAGE", images: off4Images, price: 1040, description: "Transparent polycarbonate carry-on case. Black handles, wheels and labelling on the locks and telescopic handle", detail: "100% Polycarbonate")
        offs.append(off4)
        
        return offs
        
    }
}

