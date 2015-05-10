//
//  JESAStarWarsUniverse.swift
//  StarWars
//
//  Created by José Enrique Sanchez on 10/5/15.
//  Copyright (c) 2015 Devappify. All rights reserved.
//

import Foundation
import UIKit

class JESAStarWarsUniverse {
    
    // Inits
    init(){
        // creamos los personajes
        // Vader
        
        if let vaderURL = NSURL(string: "http://en.wikipedia.org/wiki/Darth_Vader"),
           let vaderSound = NSData(contentsOfFile: "vader.caf"),
            let vaderImage = UIImage(named: "darthVader.jpg"){
        
                var vader = JESAStarWarsCharacter(name: "Anakin Skywalker", alias: "Darth Vader", image: vaderImage, sound: vaderSound, characterURL: vaderURL)
        }
        
    }                // default init
}