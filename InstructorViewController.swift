//
//  InstructorViewController.swift
//  CheckIn
//
//  Created by Dominic Bueno on 11/26/16.
//  Copyright © 2016 Bueno. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

var check = false
class InstructorViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var MapView: MKMapView!
    @IBOutlet weak var SettingsTable: UITableView!
    
    
 
    @IBOutlet weak var BackButton: UIButton!
    @IBOutlet weak var CreateButton: UIButton!
    @IBOutlet weak var TableTitle: UILabel!

    @IBOutlet weak var ClassTableView: UITableView!
    
    @IBOutlet weak var SuccessBanner: UIImageView!
    struct StepperViewCell {
        let cell: Int!
        let labelTitle: String!
        let defaultVal: Int!
        let suffix: String!
    }
    
    @IBAction func CreatePressed(_ sender: Any) {
        check = true
        
        SuccessBanner.isHidden = false
        SettingsTable.isHidden = true
        CreateButton.isHidden = true
    }
    
    
    
    
    var arrayOfCells = [StepperViewCell]()
    var trackedCells = [UITableViewCell]()
    
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height
        let tableTitleYPos = screenHeight/16
        let tableTitleXpos = screenWidth/32
        ClassTableView.delegate = self
        ClassTableView.dataSource = self
        
        
        BackButton.addTarget(self, action: #selector(InstructorViewController.buttonTapped), for: .touchUpInside)
        
        TableTitle.frame = CGRect(x:tableTitleXpos,y:tableTitleYPos,width:300,height:50)
        ClassTableView.frame = CGRect(x: 0, y :tableTitleYPos + 50, width: screenWidth, height: screenHeight/2)
        
      
       
        
        arrayOfCells = [StepperViewCell(cell: 0, labelTitle: "Range", defaultVal: 50, suffix: "ft"), StepperViewCell(cell: 1, labelTitle: "Time Limit", defaultVal: 1, suffix: "minute")]
        
        

        SettingsTable.delegate = self
        SettingsTable.dataSource = self
        
        let locValue:CLLocationCoordinate2D = locationManager.location!.coordinate
        
        self.MapView.showsUserLocation = true
     

        
        
        let latitude:CLLocationDegrees = locValue.latitude
        
        let longitude:CLLocationDegrees = locValue.longitude
        
        let latDelta:CLLocationDegrees = 0.025
        
        let lonDelta:CLLocationDegrees = 0.025
        
        let span = MKCoordinateSpanMake(latDelta, lonDelta)
        
        let location = CLLocationCoordinate2DMake(latitude, longitude)
        
        let region = MKCoordinateRegionMake(location, span)
        
        MapView.setRegion(region, animated: true)
        MapView.isHidden = true
        SettingsTable.isHidden = true
        CreateButton.isHidden = true
        BackButton.isHidden = true
        SuccessBanner.isHidden = true
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func buttonTapped() {
 
        MapView.isHidden = true
        SettingsTable.isHidden = true
        CreateButton.isHidden = true
        BackButton.isHidden = true
        TableTitle.isHidden = false
        ClassTableView.isHidden = false
        SuccessBanner.isHidden = true
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (tableView == self.ClassTableView) {
            let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "Default")
            cell.backgroundColor = UIColor.black
            //cell.backgroundColor = UIColor.darkGray
            cell.textLabel?.textColor = UIColor.white
            cell.detailTextLabel!.textColor = UIColor.lightGray
            cell.textLabel!.text = "CS 98/198"
            cell.detailTextLabel!.text = "iOS Decal"
            
            return cell
            
        }
        
        if (indexPath.row >= arrayOfCells.count) {
            
             let cell = Bundle.main.loadNibNamed("SwitchViewCell", owner: self, options: nil)?.first as! SwitchViewCell
            return cell
        }
        
        let terms = arrayOfCells[indexPath.row]
        let cell = Bundle.main.loadNibNamed("RangeViewCell", owner: self, options: nil)?.first as! RangeViewCell
        
        cell.TitleLabel.text = terms.labelTitle
        if (terms.cell == 1){
            cell.AdjustmentLabel.text = String(terms.defaultVal) + " " + terms.suffix

        } else {
            cell.AdjustmentLabel.text = String(terms.defaultVal) + terms.suffix
        }
        
        trackedCells.append(cell)
       
        
        
      
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        if (tableView == self.ClassTableView) {
            return 1
        }
        return arrayOfCells.count + 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        if (tableView == self.ClassTableView){
            if (indexPath.row == 0) {
                
                MapView.isHidden = false
                SettingsTable.isHidden = false
                CreateButton.isHidden = false
                ClassTableView.isHidden = true
                TableTitle.isHidden = true
                BackButton.isHidden = false
            
                
            
            }
        }
    }
    
  
    
    
    //let cell = tableView.dequeueReusableCellWithIdentifier("PlayerCell", forIndexPath: indexPath) 

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
