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

    @IBOutlet weak var nameLabel: UITextField!

    var dataDelegate:DataSendingDelegate?
 
    @IBAction func createButtonClick(sender: AnyObject) {
        if let teamName = nameLabel.text{
            //TODO need to add logo selection method
        
            dataDelegate?.sendData(teamName, teamLogo: nil)
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        self.nameLabel.delegate=self
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        nameLabel.endEditing(true)
        return true;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}