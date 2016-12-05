//
//  RangeViewCell.swift
//  CheckIn
//
//  Created by Dominic Bueno on 11/26/16.
//  Copyright © 2016 Bueno. All rights reserved.
//

import UIKit

class RangeViewCell: UITableViewCell {

    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var AdjustmentLabel: UILabel!
    @IBOutlet weak var Stepper: UIStepper!
    var defVal: Double = 0.0
    var startRange = 50
    var startMin = 1
    var current1 = 100
    var current2 = 1
    
   
  
    @IBAction func ChangeValue(_ sender: Any) {
        
    
        if (TitleLabel.text == "Range") {
            current1 = Int(50 * Stepper.value) + 50
            AdjustmentLabel.text = String(current1) + "ft"
            
        } else {
            current2 = Int(1 * Stepper.value) + 1
            if (current2 > 1) {
                AdjustmentLabel.text = String(current2) + " minutes"
            } else {
                AdjustmentLabel.text = String(current2) + " minute"
                
            }
            
        }
    }
    
}
