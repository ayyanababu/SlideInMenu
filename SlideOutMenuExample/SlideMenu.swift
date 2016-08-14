//
//  SlideMenu.swift
//  SlideOutMenuExample
//
//  Created by Raja Ayyan on 14/08/16.
//  Copyright © 2016 metricstream. All rights reserved.
//

import UIKit

class SlideMenu: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    lazy var menuView = UIView()
    lazy var menu = UITableView()
    lazy var blackView = UIView()
    lazy var navigationview = UINavigationBar()
    
    
    let cellID = "cell"
    let PERCENTAGE_TO_SLIDE: CGFloat = 0.50
    
    override init() {
        super.init()
        
        self.menu.delegate = self
        self.menu.dataSource = self
        self.menu.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellID)
    }
    
    
    func clickOnMenuIcon(){
        
        if let window = UIApplication.sharedApplication().keyWindow{
            
            blackView.frame =  window.frame
            
            //adding Tableview to window
            self.menu.layer.shadowColor = UIColor.darkGrayColor().CGColor
            self.menu.layer.shadowOffset = CGSizeMake(3.0, 0.0)
            self.menu.layer.shadowOpacity = 0.8
            self.menu.frame = CGRectMake(0, 0, 0, window.frame.size.height)
            
            window.addSubview(blackView)
            window.addSubview(menu)
            
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideMenu)))
            blackView.backgroundColor = UIColor(white: 0.0, alpha: 1.0)
            self.blackView.alpha = 0
            
            let widthtoBe = window.frame.width * PERCENTAGE_TO_SLIDE
            
            UIView.animateWithDuration(1.0, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1.0, options: .CurveEaseOut, animations: {
                self.blackView.alpha = 0.5
                self.menu.frame = CGRectMake(window.frame.origin.x, window.frame.origin.y, widthtoBe, window.frame.height)
                
                }, completion: nil)
            
        }
        
    }
    
    
    func hideMenu(){
        
        let window = UIApplication.sharedApplication().keyWindow
        UIView.animateWithDuration(1.0, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1.0, options: .CurveEaseOut, animations: {
            self.blackView.alpha = 0
            self.menu.frame = CGRectMake(0, 0, 0, window!.frame.size.height)
            
            }, completion: nil)
    }
    
}


extension SlideMenu{
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellID, forIndexPath: indexPath)
        cell.imageView?.image = UIImage(named: "swiftimage")
        cell.textLabel?.text = "test data"
        
        return cell
    }
    
}
