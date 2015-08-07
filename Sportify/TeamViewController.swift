//
//  TeamViewController.swift
//  Sportify
//
//  Created by Andrew Codispoti on 2015-08-06.
//  Copyright (c) 2015 Andrew Codispoti. All rights reserved.
//

import Foundation
import CoreData
class TeamViewController:UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    var games:[NSManagedObject] = []
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let row = indexPath.row
        var cell:AnyObject?
        if row == 0{
            cell = tableView.dequeueReusableCellWithIdentifier("headingCell")
            
        }else if row == 1{
            cell = tableView.dequeueReusableCellWithIdentifier("chartCell")

        }else {
            cell = tableView.dequeueReusableCellWithIdentifier("defaultCell")
        }
        return cell as! UITableViewCell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count + 2
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        switch indexPath.row{
        case 0:
            return 100
        case 1:
            return 200
        default:
            return 50
        }
    }
}