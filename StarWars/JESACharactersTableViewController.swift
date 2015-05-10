//
//  JESACharactersTableViewController.swift
//  StarWars
//
//  Created by José Enrique Sanchez on 10/5/15.
//  Copyright (c) 2015 Devappify. All rights reserved.
//

import UIKit

class JESACharactersTableViewController: UITableViewController {
    
    var model = JESAStarWarsUniverse()
    
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
        if section == 0{
            return model.countImperials
        }else{
            return model.countRebels
        }
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var character = JESAStarWarsCharacter()
        
        if indexPath.section == 0{
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
        
        if section == 0{
            return "Imperials"
        }else{
            return "Rebels"
        }
    }
    
}
