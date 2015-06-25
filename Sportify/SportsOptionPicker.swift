//
//  SportsOptionPicker.swift
//  Sportify
//
//  Created by Andrew Codispoti on 2015-06-08.
//  Copyright (c) 2015 Andrew Codispoti. All rights reserved.
//

import Foundation
import UIKit
class SportsOptionPicker:UIViewController,UIPickerViewDataSource,UIPickerViewDelegate,UITextFieldDelegate{
    var sportName:String?
    var sport:SPORT_TYPE?
    var timerView:TimePickerView
    var pointView:UIPickerView
    var pickerData=[Int]()
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        timerView=TimePickerView()
        pointView=UIPickerView()
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        pointView.delegate=self

    }
    @IBOutlet weak var homeTeamLabel: UITextField!

    @IBOutlet weak var awayTeamLabel: UITextField!
    required init(coder aDecoder: NSCoder) {
        timerView=TimePickerView()
        pointView=UIPickerView()
        super.init(coder: aDecoder)
        pointView.delegate=self
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title=sportName
        for i in 1...200{
            self.pickerData.append(i)
        }
        self.optionsView.addSubview(pointView)
        pointView.hidden=true
        self.optionsView.addSubview(timerView)
        segControl.addTarget(self, action: "toggleSelectionView", forControlEvents: UIControlEvents.ValueChanged)
        self.homeTeamLabel.delegate=self
        self.awayTeamLabel.delegate=self
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
    func toggleSelectionView(){
        if pointView.hidden{
            pointView.hidden=false
            timerView.hidden=true
            optionsView.bringSubviewToFront(timerView)
        }
        else{
            pointView.hidden=true
            timerView.hidden=false;
            optionsView.bringSubviewToFront(pointView)
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
            if let svc=segue.destinationViewController as? SportViewController{
                svc.sport=self.sport
                svc.sportName=self.sportName
                svc.pointLimit=pickerData[pointView.selectedRowInComponent(0)]
                svc.timeLimit=(timerView.hour,timerView.minute,timerView.second)
                svc.homeTeamName=self.homeTeamLabel.text
                svc.awayTeamName=self.awayTeamLabel.text
            }
        }
    }
    class TimePickerView: UIPickerView, UIPickerViewDataSource, UIPickerViewDelegate {
        var hour:Int = 0
        var minute:Int = 0
        var second:Int = 0
        
        
        required internal init(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            self.setup()
        }
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            self.setup()
        }
        
        func setup(){
            self.delegate = self
            self.dataSource = self
        }
        
        func getDate() -> NSDate{
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "HH:mm:ss"
            let date = dateFormatter.dateFromString(String(format: "%02d", self.hour) + ":" + String(format: "%02d", self.minute))
            return date!
        }
        
        func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
            return 3
        }
        
        func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            switch component {
            case 0:
                self.hour = row
            case 1:
                self.minute = row
            case 2:
                self.second = row
            default:
                println("No component with number \(component)")
            }
        }
        
        func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            if component == 0 {
                return 24
            }else if component == 1{
                return 60
            }
            return 60
        }
        
        func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
            return 30
        }
        func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView!) -> UIView {
            if (view != nil) {
                (view as! UILabel).text = String(format:"%02lu", row)
                return view
            }
            let columnView = UILabel(frame: CGRectMake(35, 0, self.frame.size.width/3 - 35, 30))
            columnView.text = String(format:"%02lu", row)
            columnView.textAlignment = NSTextAlignment.Center
            
            return columnView
        }
        
    }
}