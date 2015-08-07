//
//  DataSendingDelegate.swift
//  Sportify
//
//  Created by Andrew Codispoti on 2015-08-06.
//  Copyright (c) 2015 Andrew Codispoti. All rights reserved.
//

import Foundation

protocol DataSendingDelegate{
    func sendData(teamName:String, teamLogo:UIImage?)
}