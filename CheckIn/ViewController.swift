//
//  ViewController.swift
//  CheckIn
//
//  Created by Dominic Bueno on 11/25/16.
//  Copyright © 2016 Bueno. All rights reserved.
//

import UIKit
import CoreLocation
import Foundation

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    @IBOutlet weak var CheckInButton: UIButton!
    
    @IBOutlet weak var TableView: UITableView!
    
    @IBOutlet weak var ClassTitle: UILabel!
    
    @IBOutlet weak var TableTitle: UILabel!
    let locationManager = CLLocationManager()
    let unavailable = UIImage(named: "unavailable.png")
    let checkin = UIImage(named: "bluecheck_simple.png")
    let success = UIImage(named: "success.png")
    var lastPressedIndex: Int = -1
    var shifted = false
    

    @IBOutlet weak var completeBanner: UIImageView!
    
    @IBOutlet weak var successBanner: UIImageView!
   
    @IBAction func checkinPress(_ sender: Any) {
        
        if (CheckInButton.currentImage == checkin) {
            
            stateManager.overWriteState(index: lastPressedIndex, buttonIm: unavailable!, completedStat: true, successState: false, buttonHide: true)
            
            updateDisplayState()
            
            
            
            //CheckInButton.setImage(success, for: UIControlState.normal)
        }
    }
    
    
    func updateDisplayState() {
        CheckInButton.isHidden =  stateManager.statuses[lastPressedIndex].buttonHidden
        CheckInButton.setImage(stateManager.statuses[lastPressedIndex].buttonImage, for: UIControlState.normal)
        completeBanner.isHidden = stateManager.statuses[lastPressedIndex].completedStatus
        successBanner.isHidden = stateManager.statuses[lastPressedIndex].successStatus
 
        
    }
    
    
    func fillTable() {
        classManager.addTask(t: "CS 98/198", desc: "iOS Decal")
        classManager.addTask(t: "CS 161", desc: "Computer Security")
        classManager.addTask(t: "CS 188", desc: "Intro to Artificial Intelligence")
        classManager.addTask(t: "CS 186", desc: "Intro to Databases")
        
        for _ in classManager.classes {
            stateManager.updateState(buttonIm: unavailable!, completedStat: true, successState: true, buttonHide: false)
        }
    }
    
    override func viewDidLoad() {
        completeBanner.isHidden = true
        successBanner.isHidden = true
    
        
        if CLLocationManager.locationServicesEnabled() {
      
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        
        
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height
        let tableTitleYPos = screenHeight/16
        let tableTitleXpos = screenWidth/32
        super.viewDidLoad()
        TableView.delegate = self
        TableView.dataSource = self
        CheckInButton.isHidden = true
       
        
        
        TableTitle.frame = CGRect(x:tableTitleXpos,y:tableTitleYPos,width:300,height:50)
        TableView.frame = CGRect(x: 0, y :tableTitleYPos + 50, width: screenWidth, height: screenHeight/2)
        
        
        
        self.fillTable()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return classManager.classes.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "Default")
        cell.backgroundColor = UIColor.black
        //cell.backgroundColor = UIColor.darkGray
        cell.textLabel?.textColor = UIColor.white
        cell.detailTextLabel!.textColor = UIColor.lightGray
        
        cell.textLabel!.text = classManager.classes[indexPath.row].title
        cell.detailTextLabel!.text = classManager.classes[indexPath.row].description
 
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let previous: Int = lastPressedIndex
        
        lastPressedIndex = indexPath.row
        
        
        if (indexPath.row == 0 && check && !(stateManager.statuses[lastPressedIndex].successStatus == false || stateManager.statuses[lastPressedIndex].completedStatus == false)) {
            
            stateManager.overWriteState(index: lastPressedIndex, buttonIm: checkin!, completedStat: true, successState: true, buttonHide: false)
            
        }
        
        if (stateManager.statuses[lastPressedIndex].successStatus == false && lastPressedIndex != previous) {
         
            stateManager.overWriteState(index: lastPressedIndex, buttonIm: unavailable!, completedStat: false, successState: true, buttonHide: true)
            updateDisplayState()
        }
 
        
     
        let courseTitle: String = classManager.classes[indexPath.row].title
 
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height
        var tableTitleYPos = screenHeight/3
        let tableTitleXpos = screenWidth/32
        
        
        let distance = calcDistance()
        
        /*
        if (distance <= 30.48) {
            CheckInButton.setImage(checkin, for: UIControlState.normal)
        } else {
            CheckInButton.setImage(unavailable, for: UIControlState.normal)
            
        }*/
        
        updateDisplayState()
        
     
        if (!shifted){
            self.shifted = true
        
            UIView.animate(withDuration: 0.01, delay: 0, options: [.curveEaseOut], animations: {
                self.TableView.center.y += 180.645833333333
                self.TableTitle.center.y += 180.645833333333
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
        
      
        
        
        
        //TableTitle.frame = CGRect(x:tableTitleXpos,y:tableTitleYPos,width:300,height:50)
        //TableView.frame = CGRect(x: 0, y :tableTitleYPos + 50, width: screenWidth, height: screenHeight/2)
        
   

        
        
        //CheckInButton.isHidden = false
        
        
        ClassTitle.text = courseTitle
        
       
        
    }
    
    func calcDistance() -> Double {
        let locValue:CLLocationCoordinate2D = locationManager.location!.coordinate

        
        let lon1 = locValue.longitude
        let lat1 = locValue.latitude
        let lon2 = locValue.longitude
        let lat2 = locValue.latitude
        

        
        
        let coordinate₀ = CLLocation(latitude: lat1, longitude: lon1)
        let coordinate₁ = CLLocation(latitude: lat2, longitude: lon2)
        
        let distanceInMeters = coordinate₀.distance(from: coordinate₁)
       
        //print(distanceInMeters)
        
        return distanceInMeters
        
        
        
      
    }
    
    



}

