//
//  ViewController.swift
//  Sportify
//
//  Created by Andrew Codispoti on 2015-06-01.
//  Copyright (c) 2015 Andrew Codispoti. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var sports:[String:String]=["Baseball":"⚾️","Soccer":"⚽️","Football":"🏈","Basketball":"🏀","Tennis":"🎾"];
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
            let row=indexPath.row
            let keys=[String](sports.keys)
            let key=keys[row]
            var value:String=sports[key]!
            cell.textLabel?.text=key;
            let label=UILabel()
            label.text=value
            label.sizeToFit()
            cell.accessoryView=label
            return cell
    }
    func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int{
            return sports.count
            
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
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
                    default:
                        destination.sport=SPORT_TYPE.GENERIC;
                    }
                    
                    destination.sportName=([String](sports.keys))[index]
                }
            }
        }
    }
}

