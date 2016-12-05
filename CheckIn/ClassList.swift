//
//  ClassList.swift
//  CheckIn
//
//  Created by Dominic Bueno on 11/25/16.
//  Copyright © 2016 Bueno. All rights reserved.
//


import UIKit

var classManager: ClassList = ClassList()

struct course {
    var title: String = "Undefined"
    var description: String = "Undefined"
    
}


class ClassList: NSObject {
    
    var classes: [(course)] = []
    
    func addTask(t: String, desc: String) {
        classes.append(course(title: t, description: desc))
    }
    
}
