//
//  Bands.swift
//  Metal Band App
//
//  Created by Conor Thomas Higgins on 23/02/2017.
//  Copyright © 2017 Conor Thomas Higgins. All rights reserved.
//

import Foundation

class Bands
{
    var data : [Band] = []
    
    init(fromXML : String)
    {
        // make an XMLBandParser, and begin parsing
        let parser = XMLBandsParser(name: fromXML)
        parser.beginParsing()
        
        // init data
        self.data = parser.bands
    }
    
    // functions
    func getBand(id:Int)->Band
    {
        return data[id]
    }
    
    func getCount()->Int
    {
        return data.count
    }
}
