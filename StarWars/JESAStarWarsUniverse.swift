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
    
    var rebels : Array<JESAStarWarsCharacter>
    var imperials : Array<JESAStarWarsCharacter>
    
    var countRebels : Int{
        get{
            // devuelve el total de personajes rebeldes
            return rebels.count
        }
    }
    
    var countImperials : Int{
        get{
            // devuelve el total de personajes imperiales
            return imperials.count
        }
    }
    
    // Inits
    init(){
        // creamos los personajes
        
        // Vader
        var vader = JESAStarWarsCharacter()
        
        var b = NSBundle.mainBundle()
        
        if  let vaderURL = NSURL(string: "http://en.wikipedia.org/wiki/Darth_Vader"),
            let soundURL = b.URLForResource("vader", withExtension: "caf"),
            let vaderSound = NSData(contentsOfURL: soundURL),
            let vaderImage = UIImage(named: "darthVader.jpg"){
        
                vader = JESAStarWarsCharacter(name: "Anakin Skywalker", alias: "Darth Vader", image: vaderImage, sound: vaderSound, characterURL: vaderURL)
        }
        
        // Tarkin
        var tarkin = JESAStarWarsCharacter()
        
        if  let tarkinURL = NSURL(string: "http://en.wikipedia.org/wiki/Grand_Moff_Tarkin"),
            let soundURL = b.URLForResource("tarkin", withExtension: "caf"),
            let tarkinSound = NSData(contentsOfURL: soundURL),
            let tarkinImage = UIImage(named: "tarkin.jpg"){
                
                tarkin = JESAStarWarsCharacter(name: "Wilhuf Tarkin", alias: "Grand Moff Tarkin", image: tarkinImage, sound: tarkinSound, characterURL: tarkinURL)
        }
        
        // Palpatine
        var palpatin = JESAStarWarsCharacter()
        
        if  let palpatinURL = NSURL(string: "http://en.wikipedia.org/wiki/Palpatine"),
            let soundURL = b.URLForResource("palpatine", withExtension: "caf"),
            let palpatinSound = NSData(contentsOfURL: soundURL),
            let palpatinImage = UIImage(named: "palpatine.jpg"){
                
                palpatin = JESAStarWarsCharacter(name: "Palpatine", alias: "Darth Sidious", image: palpatinImage, sound: palpatinSound, characterURL: palpatinURL)
        }
        
        
        // Chewbacca
        var chewbacca = JESAStarWarsCharacter()
        
        if  let chewbaccaURL = NSURL(string: "http://en.wikipedia.org/wiki/Chewbacca"),
            let soundURL = b.URLForResource("chewbacca", withExtension: "caf"),
            let chewbaccaSound = NSData(contentsOfURL: soundURL),
            let chewbaccaImage = UIImage(named: "chewbacca.jpg"){
                
                chewbacca = JESAStarWarsCharacter(name: "", alias: "Chewbacca", image: chewbaccaImage, sound: chewbaccaSound, characterURL: chewbaccaURL)
        }
        
        
        // C-3PO
        var c3po = JESAStarWarsCharacter()
        
        if  let c3poURL = NSURL(string: "http://en.wikipedia.org/wiki/C-3PO"),
            let soundURL = b.URLForResource("c3po", withExtension: "caf"),
            let c3poSound = NSData(contentsOfURL: soundURL),
            let c3poImage = UIImage(named: "c3po.jpg"){
                
                c3po = JESAStarWarsCharacter(name: "", alias: "C-3PO", image: c3poImage, sound: c3poSound, characterURL: c3poURL)
        }
        
        // Yoda
        var yoda = JESAStarWarsCharacter()
        
        if  let yodaURL = NSURL(string: "http://en.wikipedia.org/wiki/Yoda"),
            let soundURL = b.URLForResource("yoda", withExtension: "caf"),
            let yodaSound = NSData(contentsOfURL: soundURL),
            let yodaImage = UIImage(named: "yoda.jpg"){
                
                yoda = JESAStarWarsCharacter(name: "Minch Yoda", alias: "Yoda", image: yodaImage, sound: yodaSound, characterURL: yodaURL)
        }
        
        // R2-D2
        var r2d2 = JESAStarWarsCharacter()
        
        if  let r2d2URL = NSURL(string: "http://en.wikipedia.org/wiki/R2-D2"),
            let soundURL = b.URLForResource("r2-d2", withExtension: "caf"),
            let r2d2Sound = NSData(contentsOfURL: soundURL),
            let r2d2Image = UIImage(named: "R2-D2.jpg"){
                
                r2d2 = JESAStarWarsCharacter(name: "", alias: "R2-D2", image: r2d2Image, sound: r2d2Sound, characterURL: r2d2URL)
        }
        
        rebels = [chewbacca, c3po, yoda, r2d2]
        imperials = [vader, tarkin, palpatin]
        
    }
    
    
}