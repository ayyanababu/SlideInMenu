//
//  SlideMenu.swift
//  SlideOutMenuExample
//
//  Created by Raja Ayyan on 14/08/16.
//  Copyright © 2016 metricstream. All rights reserved.
//

import UIKit

class SlideMenu: NSObject {
    
    lazy var menuView = UIView()
    lazy var blackView = UIView()
    
    override init() {
        super.init()
    }
    
    
    func clickOnMenuIcon(){
    
        if let window = UIApplication.sharedApplication().keyWindow{
            
            blackView.frame =  window.frame
            self.menuView.backgroundColor = UIColor.whiteColor()
            self.menuView.frame = CGRectMake(0, 0, 0, window.frame.size.height)
            window.addSubview(blackView)
            window.addSubview(menuView)
            
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideMenu)))
            blackView.backgroundColor = UIColor(white: 0.0, alpha: 1.0)
            self.blackView.alpha = 0
            
            let widthtoBe = window.frame.width * 0.50
            
            UIView.animateWithDuration(1.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1.0, options: .CurveEaseOut, animations: {
                self.blackView.alpha = 0.5
                self.menuView.frame = CGRectMake(window.frame.origin.x, window.frame.origin.y, widthtoBe, window.frame.height)
                
                }, completion: nil)
            
        }

    }
    
    
    func hideMenu(){
        
        let window = UIApplication.sharedApplication().keyWindow
        UIView.animateWithDuration(1.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1.0, options: .CurveEaseOut, animations: {
            self.blackView.alpha = 0
            self.menuView.frame = CGRectMake(0, 0, 0, window!.frame.size.height)
            
            }, completion: nil)
    }

}
