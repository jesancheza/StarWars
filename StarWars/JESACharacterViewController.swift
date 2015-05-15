//
//  JESACharacterViewController.swift
//  StarWars
//
//  Created by José Enrique Sanchez on 10/5/15.
//  Copyright (c) 2015 Devappify. All rights reserved.
//

import UIKit

class JESACharacterViewController: UIViewController , UISplitViewControllerDelegate, JESACharactersTableViewControllerDelegate{
    
    var model = JESAStarWarsCharacter()
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func playSound(sender: AnyObject) {
        
    }
    
    @IBAction func showWiki(sender: AnyObject) {
        
    }
    
    // MARK: - Init
    convenience init (model: JESAStarWarsCharacter){
        
        self.init(nibName:"JESACharacterViewController", bundle: nil)
        
        self.model = model
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = model.alias
        
        if let image = model.image{
            self.imageView.image = image
        }
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // Si estoy dentro de un SplitVC me pongo el botón
        self.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UISplitViewControllerDelegate
    func splitViewController(svc: UISplitViewController,
        willChangeToDisplayMode displayMode: UISplitViewControllerDisplayMode){
        
        if displayMode == UISplitViewControllerDisplayMode.PrimaryHidden{
            self.navigationItem.leftBarButtonItem = svc.displayModeButtonItem()
        }else{
            self.navigationItem.leftBarButtonItem = nil
        }
    }
    
    // MARK: - JESACharactersTableViewControllerDelegate
    func starWarsViewController(swvc: JESACharactersTableViewController,
        didSelectCharacter: JESAStarWarsCharacter){
        
        // Cambiamos la imagen
        self.imageView.image = didSelectCharacter.image
        
        // Sincronizamos el modelo
        self.model = didSelectCharacter
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
