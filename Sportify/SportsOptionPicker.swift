//
//  SportsOptionPicker.swift
//  Sportify
//
//  Created by Andrew Codispoti on 2015-06-08.
//  Copyright (c) 2015 Andrew Codispoti. All rights reserved.
//

import Foundation
import UIKit
class SportsOptionPicker:UIViewController,UIPickerViewDataSource,UIPickerViewDelegate{
    var sportName:String?
    var sport:SPORT_TYPE?
    var timerView:UIDatePicker?
    var pointView:UIPickerView?
    var pickerData=[Int]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title=sportName
        for i in 1...200{
            self.pickerData.append(i)
        }
        timerView=UIDatePicker()
        timerView!.datePickerMode=UIDatePickerMode.CountDownTimer
        
        pointView=UIPickerView()
        pointView!.delegate=self
        
        self.optionsView.addSubview(pointView!)
        pointView?.hidden=true
        self.optionsView.addSubview(timerView!)
        segControl.addTarget(self, action: "toggleSelectionView", forControlEvents: UIControlEvents.ValueChanged)
    }
    
    @IBOutlet weak var segControl: UISegmentedControl!
    @IBOutlet weak var optionsView: UIView!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func toggleSelectionView(){
        if pointView!.hidden{
            pointView?.hidden=false
            timerView?.hidden=true
            optionsView.bringSubviewToFront(timerView!)
        }
        else{
            pointView?.hidden=true
            timerView?.hidden=false;
            optionsView.bringSubviewToFront(pointView!)
        }
    }

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int{
        return 1
    }


    func pickerView(pickerView: UIPickerView,
        numberOfRowsInComponent component: Int) -> Int{
        return self.pickerData.count
    }

    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return "\(pickerData[row])"
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier=="gamestart"){
            if let svc=sender!.destinationViewController as? SportViewController{
                svc.sport==self.sport
                svc.sportName=self.sportName
                
            }
        }
    }
}