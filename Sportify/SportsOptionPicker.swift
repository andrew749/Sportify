//
//  SportsOptionPicker.swift
//  Sportify
//
//  Created by Andrew Codispoti on 2015-06-08.
//  Copyright (c) 2015 Andrew Codispoti. All rights reserved.
//

import Foundation
import UIKit
class SportsOptionPicker:UIViewController,UITextFieldDelegate{

    var pickerData=[Int]()

    @IBOutlet weak var nameLabel: UITextField!

 
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 1...200{
            self.pickerData.append(i)
        }
        segControl.addTarget(self, action: "toggleSelectionView", forControlEvents: UIControlEvents.ValueChanged)
        self.nameLabel.delegate=self
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        return true;
    }
    @IBOutlet weak var segControl: UISegmentedControl!
    @IBOutlet weak var optionsView: UIView!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier=="gamestart"){
            if let svc=segue.destinationViewController as? SportViewController{
            }
        }
    }
}