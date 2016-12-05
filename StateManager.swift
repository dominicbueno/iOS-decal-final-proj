//
//  StateManager.swift
//  CheckIn
//
//  Created by Dominic Bueno on 11/26/16.
//  Copyright © 2016 Bueno. All rights reserved.
//

import Foundation
import UIKit

var stateManager: StateManager = StateManager()

struct courseStatus {
    var buttonImage: UIImage
    var completedStatus = false
    var successStatus = false
    var buttonHidden = false
}

class StateManager: NSObject {
    
    var statuses: [(courseStatus)] = []
    
    func updateState(buttonIm: UIImage, completedStat: Bool, successState: Bool, buttonHide: Bool) {
        statuses.append(courseStatus(buttonImage: buttonIm, completedStatus: completedStat, successStatus: successState, buttonHidden: buttonHide))
    }
    func overWriteState(index: Int, buttonIm: UIImage, completedStat: Bool, successState: Bool, buttonHide: Bool) {
    statuses[index] = courseStatus(buttonImage: buttonIm, completedStatus: completedStat, successStatus: successState, buttonHidden: buttonHide)
    }
    
}
