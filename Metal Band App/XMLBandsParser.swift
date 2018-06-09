//
//  XMLBandsParser.swift
//  Metal Band App
//
//  Created by Conor Thomas Higgins on 23/02/2017.
//  Copyright © 2017 Conor Thomas Higgins. All rights reserved.
//

import Foundation
import UIKit

class XMLBandsParser : NSObject, XMLParserDelegate
{
    // properties
    var name : String
    init(name : String){self.name = name}
    
    // some variables for parsing
    var bName, bCountry, bGenre, bFormed, bImage, bIcon, bURL : String! // to collect the xml data
    var passElementId : Int = -1
    var passData : Bool = false // spy variables to say which tag is found
    
    var bands = [Band]() // to collect person object when needed
    
    var parser = XMLParser()
    
    let tags = ["name", "country", "genre", "formed", "image", "icon", "url"]
    
    // functions for parsing
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:])
    {
        // reset the spy vars for tags
        if tags.contains(elementName)
        {
            // set spies for the appropriate tag
            passElementId = tags.index(of: elementName)!
            passData = true
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?)
    {
        // reset spies for new pull
        if tags.contains(elementName)
        {
            // set spies for the appropriate tag
            passElementId = -1
            passData = false
        }
        
        // test if tag is </band>
        if elementName == "band"
        {
            // make a new person and add it to people
            let b = Band(name: bName, country: bCountry, genre: bGenre, formed: bFormed, image: bImage, icon: bIcon, url: bURL)
            
            bands.append(b)
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String)
    {
        // place data that is obtained from between tags
        if passData
        {
            switch passElementId
            {
            case 0 : bName = string
            case 1 : bCountry = string
            case 2 : bGenre = string
            case 3 : bFormed = string
            case 4 : bImage = string
            case 5 : bIcon = string
            case 6 : bURL = string
            default : break
            }
        }
    }
    
    func beginParsing()
    {
        // find the file path
        let bundleURL = Bundle.main.bundleURL
        let fileURL = URL(string: self.name, relativeTo: bundleURL)
        
        parser = XMLParser(contentsOf: fileURL!)!
        
        //set the delegate and parse
        parser.delegate = self
        parser.parse()
    }
    
}
