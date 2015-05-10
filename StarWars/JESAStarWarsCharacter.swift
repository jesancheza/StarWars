//
//  JESAStarWarsCharacter.swift
//  StarWars
//
//  Created by José Enrique Sanchez on 10/5/15.
//  Copyright (c) 2015 Devappify. All rights reserved.
//

import UIKit

class JESAStarWarsCharacter {
    
    var name : String?
    var alias : String?
    var image : UIImage?
    var sound : NSData?
    var characterURL : NSURL?
    
    
    // Inits
    init(){}                // default init
    
    convenience init(name String, alias String, image UIImage, sound NSData, characterURL NSURL){
        self.name = name
        self.alias = alias
        self.image = image
        self.sound = sound
        self.characterURL = characterURL
    }
    
}