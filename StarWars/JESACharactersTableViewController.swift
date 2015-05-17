//
//  JESACharactersTableViewController.swift
//  StarWars
//
//  Created by José Enrique Sanchez on 10/5/15.
//  Copyright (c) 2015 Devappify. All rights reserved.
//

import UIKit
import Foundation

// MARK: Protocolo delegado StarWarsUniverseViewControllerDelegate
protocol JESACharactersTableViewControllerDelegate{
    func starWarsViewController(chvc: JESACharactersTableViewController,
        didSelectCharacter: JESAStarWarsCharacter)
}

class JESACharactersTableViewController: UITableViewController, JESACharactersTableViewControllerDelegate {
    
    // Constantes
    let IMPERIALS = 0
    let REBLES = 1
    
    var model = JESAStarWarsUniverse()
    
    var delegate : JESACharactersTableViewControllerDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Universe"
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // Return the number of rows in the section.
        if section == IMPERIALS{
            return model.countImperials
        }else{
            return model.countRebels
        }
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var character = JESAStarWarsCharacter()
        
        if indexPath.section == IMPERIALS{
            character = model.imperials[indexPath.row]
        }else{
            character = model.rebels[indexPath.row]
        }
        
        let cellId = "cellId"
        
        let cell:UITableViewCell=UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: cellId)

        // Configure the cell...
        
        cell.textLabel?.text = character.alias
        cell.imageView?.image = character.image
        cell.detailTextLabel?.text = character.name

        return cell
    }

    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == IMPERIALS{
            return "Imperials"
        }else{
            return "Rebels"
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        var character = JESAStarWarsCharacter()
        
        if indexPath.section == IMPERIALS{
            character = model.imperials[indexPath.row]
        }else{
            character = model.rebels[indexPath.row]
        }
        
        // Llamamos al delegado para cargar el personaje
        self.delegate?.starWarsViewController(self, didSelectCharacter: character)
        
        // Enviamos la notificación
        let notification : NSNotificationCenter = NSNotificationCenter.defaultCenter()
        
        var param = Dictionary<String, JESAStarWarsCharacter>()
        
        param = ["characterSelected" : character]
        
        notification.postNotificationName("didChangeCharacter", object: self, userInfo: param)
        
        // Guardamos el último personaje seleccionado
        var characterSelected : NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        var coords : Array<Int> = [indexPath.section, indexPath.row]
        characterSelected.setObject(coords, forKey: "lastCharacter")
        
        characterSelected.synchronize()
    }
    
    // MARK: - JESACharactersTableViewControllerDelegate
    func starWarsViewController(chvc: JESACharactersTableViewController,
        didSelectCharacter: JESAStarWarsCharacter){
        
            
            
    }
    
}
