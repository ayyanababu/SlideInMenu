//
//  HomeVC.swift
//  SlideOutMenuExample
//
//  Created by Raja Ayyan on 14/08/16.
//  Copyright © 2016 metricstream. All rights reserved.
//

import UIKit

class HomeVC: UITableViewController {
    
    lazy var slideMenu = SlideMenu()
    lazy var celltitles: [String] = ["Iphone","Windows","Siri","Nexus","Samsung Leo","Sony Ericson","Iphone","Windows","Siri","Nexus","Samsung Leo","Sony Ericson"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return celltitles.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("homecell", forIndexPath: indexPath) as? HomeCell
        cell?.configureCell(celltitles[indexPath.row])
        return cell!
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("cell has been tapped at index \(indexPath.row)")
    }
    
    
    
    @IBAction func clickOnMenu(sender: AnyObject) {
        print("clicked on Hamburger Icon")
        slideMenu.clickOnMenuIcon()
        
    }
    
    
        
    
    
}


