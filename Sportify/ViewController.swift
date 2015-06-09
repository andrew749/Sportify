//
//  ViewController.swift
//  Sportify
//
//  Created by Andrew Codispoti on 2015-06-01.
//  Copyright (c) 2015 Andrew Codispoti. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var sports:[String]=["Baseball","Soccer","Football","Basketball","Tennis","Hockey"];
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate=self
        tableView.dataSource=self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBOutlet weak var tableView: UITableView!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
            var cell:UITableViewCell=tableView.dequeueReusableCellWithIdentifier("sportcell") as! UITableViewCell;
            cell.textLabel?.text=sports[indexPath.row];
            return cell
    }
    func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int{
            return sports.count
            
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier=="mainviewtransition"{
            if let destination=segue.destinationViewController as? SportsOptionPicker{
                if let index=tableView.indexPathForSelectedRow()?.row{
                    switch index{
                    case 0:
                        destination.sport=SPORT_TYPE.BASEBALL
                    case 1:
                        destination.sport=SPORT_TYPE.SOCCER
                    case 2:
                        destination.sport=SPORT_TYPE.FOOTBALL
                    case 3:
                        destination.sport=SPORT_TYPE.BASKETBALL
                    case 4:
                        destination.sport=SPORT_TYPE.TENNIS
                    case 5:
                        destination.sport=SPORT_TYPE.HOCKEY
                    default:
                        destination.sport=SPORT_TYPE.GENERIC;
                    }
                    destination.sportName=sports[index]

                }
            }
        }
    }
}

