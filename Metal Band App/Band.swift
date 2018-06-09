//
//  Band.swift
//  Metal Band App
//
//  Created by Conor Thomas Higgins on 23/02/2017.
//  Copyright © 2017 Conor Thomas Higgins. All rights reserved.
//

import Foundation

class Band
{
    // properties
    var name : String = ""
    var country : String = ""
    var genre : String = ""
    var formed : String = ""
    var image : String = ""
    var icon : String = ""
    var url : String = ""
    
    init(name:String, country:String, genre:String, formed:String, image:String, icon:String, url:String)
    {
        self.name = name
        self.country = country
        self.genre = genre
        self.formed = formed
        self.image = image
        self.icon = icon
        self.url = url
    }
}
