//
//  JESAWikiViewController.swift
//  StarWars
//
//  Created by Jose Enrique Sanchez Alfonso on 15/5/15.
//  Copyright (c) 2015 Devappify. All rights reserved.
//

import UIKit

class JESAWikiViewController: UIViewController, UIWebViewDelegate {
    
    var model : JESAStarWarsCharacter
    
    @IBOutlet weak var wikiView: UIWebView!
    @IBOutlet weak var activityView: UIActivityIndicatorView!
    
    init(model : JESAStarWarsCharacter){
        
        self.model = model
        
        super.init(nibName: "JESAWikiViewController", bundle: nil)
        
        self.title = model.name
        
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        edgesForExtendedLayout = UIRectEdge.None
        
        wikiView.delegate = self
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "characterChangeInUniverse:", name: "didChangeCharacter", object: nil)
        
        syncViewModel()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        NSNotificationCenter.defaultCenter().removeObserver(self)
        
    }
    
    // MARK: - Notification didChangeCharacter
    func characterChangeInUniverse(notification: NSNotification) {
        
        let userInfo:Dictionary<String,JESAStarWarsCharacter!> = notification.userInfo as! Dictionary<String,JESAStarWarsCharacter!>
        
        self.model = userInfo["characterSelected"]!
        
        syncViewModel()
        
    }
    
    // MARK: - Util
    func syncViewModel()->(){
        
        self.title = self.model.alias
        
        if let value = self.model.characterURL{
            let requestObj = NSURLRequest(URL: self.model.characterURL!);
            
            self.wikiView.loadRequest(requestObj)
            
        }
        
    }
    
    // MARK: - UIWebViewDelegate
    
    func webViewDidStartLoad(webView: UIWebView) {

        self.activityView.hidden = false
        self.activityView.startAnimating()
        
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {

        self.activityView.hidden = true
        self.activityView.stopAnimating()
        
    }
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        if navigationType == UIWebViewNavigationType.LinkClicked || navigationType == UIWebViewNavigationType.FormSubmitted {
            return false
        }else{
            return true
        }
    }

}
