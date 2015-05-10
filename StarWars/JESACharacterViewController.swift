//
//  JESACharacterViewController.swift
//  StarWars
//
//  Created by José Enrique Sanchez on 10/5/15.
//  Copyright (c) 2015 Devappify. All rights reserved.
//

import UIKit

class JESACharacterViewController: UIViewController {
    
    var model = JESAStarWarsCharacter()
    
    // MARK: - Init
    convenience init (model: JESAStarWarsCharacter){
        
        self.init()
        
        self.model = model
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = model.alias
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
