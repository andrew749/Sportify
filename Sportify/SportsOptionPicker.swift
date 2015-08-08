//
//  SportsOptionPicker.swift
//  Sportify
//
//  Created by Andrew Codispoti on 2015-06-08.
//  Copyright (c) 2015 Andrew Codispoti. All rights reserved.
//

import Foundation
import UIKit
class SportsOptionPicker:UIViewController,UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var nameLabel: UITextField!

    var dataDelegate:DataSendingDelegate?
    var imagePicker:UIImagePickerController?
    
    var logo:UIImage?
    @IBAction func createButtonClick(sender: AnyObject) {
        if let teamName = nameLabel.text{
            //TODO need to add logo selection method
        
            dataDelegate?.sendData(teamName, teamLogo: logo)
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        self.nameLabel.delegate=self
        
        
    }
    
    @IBAction func addButtonClick(sender: AnyObject) {
        showPicker()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        nameLabel.endEditing(true)
        return true;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showPicker(){
        imagePicker = UIImagePickerController()
        imagePicker?.delegate = self
        imagePicker?.allowsEditing = true
        imagePicker?.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        self.presentViewController(imagePicker!, animated: true, completion: nil)
    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        imagePicker?.dismissViewControllerAnimated(true, completion: nil)
        logo = image
        mainImageView.image = logo
    }
    @IBOutlet weak var mainImageView: UIImageView!
}