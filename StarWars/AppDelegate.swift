//
//  AppDelegate.swift
//  StarWars
//
//  Created by José Enrique Sanchez on 9/5/15.
//  Copyright (c) 2015 Devappify. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        // Crear la UIWindow
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        // Crear los ViewController
        var vcU = JESACharactersTableViewController(nibName: "JESACharactersTableViewController", bundle:nil);
        
        // Recuperamos el personaje seleccionado si lo hay
        var characterSelected : NSUserDefaults = NSUserDefaults.standardUserDefaults()
        // Coordenadas por defecto
        var coords = [0,0]
        
        var character : JESAStarWarsCharacter = JESAStarWarsCharacter()
        
        if let lastCharacter = characterSelected.objectForKey("lastCharacter") as? Array<Int>{
            if lastCharacter[0] == 0{
                character = vcU.model.imperials[lastCharacter[1]]
            }else{
                character = vcU.model.rebels[lastCharacter[1]]
            }
        }else{
            character = vcU.model.imperials[0]
        }
        
        var vcC = JESACharacterViewController(model: character)
        
        // Crear los navigationViewController
        var navU = UINavigationController(rootViewController: vcU)
        var navC = UINavigationController(rootViewController: vcC)
        
        // Creamos el combinador
        var splitVC = UISplitViewController()
        splitVC.viewControllers = [navU, navC]
        
        // Asignamos delegados
        splitVC.delegate = vcC
        vcU.delegate = vcC
        
        // Asignarlo como root
        window?.rootViewController = splitVC
        
        // Mostrarlo
        window?.makeKeyAndVisible()
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

