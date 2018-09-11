//
//  AccountLine.swift
//  OffWhite
//
//  Created by Faishal Alif on 8/8/18.
//  Copyright © 2018 Faishal Alif. All rights reserved.
//

import Foundation

class AccountLine
{
    
    // Variables
    var name: String            // name of the product line
    var products: [Product]     // all products in the line
    
    init(named: String, includeProducts: [Product])
{
    name = named
    products = includeProducts
    }
    
    class func accountLines() -> [AccountLine]
{
    return [self.PROFILE()]
    }
    
    // Private methods
    
    private class func PROFILE() -> AccountLine {
    //  (1) iDevices: Apple Watch, iPad, iPhone, iOS
    var products = [Product]()
    
    products.append(Product(titled: "DETAILS", description: "Faishal Alif Fadhillah"))
    products.append(Product(titled: "SHiPPING ADDRESS", description: "Seturan, Yogyakarta"))
    products.append(Product(titled: "BILLING ADDRESS", description: "Seturan, Yogyakarta"))
    products.append(Product(titled: "PAYMENT METHOD", description: "Paypal"))
    
        return AccountLine(named: "", includeProducts: products)
    
    }
    
    
}
