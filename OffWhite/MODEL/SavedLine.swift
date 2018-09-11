//
//  SavedLine.swift
//  OffWhite
//
//  Created by Faishal Alif on 8/9/18.
//  Copyright © 2018 Faishal Alif. All rights reserved.
//
import Foundation

class SavedLine
{
    
    // Variables
    var name: String            // name of the product line
    var saveds: [Saved]     // all products in the line
    
    init(named: String, includeSaveds: [Saved])
    {
        name = named
        saveds = includeSaveds
    }
    
    class func savedLines() -> [SavedLine]
    {
        return [self.SAVED()]
    }
    
    // Private methods
    
    private class func SAVED() -> SavedLine {
        //  (1) iDevices: Apple Watch, iPad, iPhone, iOS
        var saveds = [Saved]()
        
         saveds.append(Saved(titled: "0 items", description: "Saved Items.", imageName: "apple-watch"))
        
        
        return SavedLine(named: "", includeSaveds: saveds)
        
    }
    
    
}
