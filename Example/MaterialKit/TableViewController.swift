//
//  TableViewController.swift
//  MaterialKit
//
//  Created by Le Van Nghia on 11/16/14.
//  Copyright (c) 2014 Le Van Nghia. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var tableView: UITableView!
    var labels = ["MKButton", "MKTextField", "MKTableViewCell", "MKTextView", "MKColor", "MKLayer", "MKAlert", "MKCheckBox"]
    var rippleLocations: [MKRippleLocation] = [.tapLocation, .tapLocation, .center, .left, .right, .tapLocation, .tapLocation, .tapLocation]
    var circleColors = [UIColor.MKColor.LightBlue, UIColor.MKColor.Grey, UIColor.MKColor.LightGreen]
    
    override func viewDidLoad() {
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell") as! MyCell
        cell.setMessage(labels[(indexPath as NSIndexPath).row % labels.count])
        cell.rippleLocation = rippleLocations[(indexPath as NSIndexPath).row % labels.count]
        
        let index = (indexPath as NSIndexPath).row % circleColors.count
        cell.rippleLayerColor = circleColors[index]
        
        return cell
    }
}
