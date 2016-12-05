//
//  InstructorTabViewController.swift
//  CheckIn
//
//  Created by Dominic Bueno on 11/28/16.
//  Copyright © 2016 Bueno. All rights reserved.
//

import UIKit

class InstructorTabViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var TableView: UITableView!
    
    @IBOutlet weak var TableTitle: UILabel!
    
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height
        let tableTitleYPos = screenHeight/16
        let tableTitleXpos = screenWidth/32
        TableView.delegate = self
        TableView.dataSource = self

        
        
        
        TableTitle.frame = CGRect(x:tableTitleXpos,y:tableTitleYPos,width:300,height:50)
        TableView.frame = CGRect(x: 0, y :tableTitleYPos + 50, width: screenWidth, height: screenHeight/2)

    
    

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "Default")
        cell.backgroundColor = UIColor.black
        //cell.backgroundColor = UIColor.darkGray
        cell.textLabel?.textColor = UIColor.white
        cell.detailTextLabel!.textColor = UIColor.lightGray
        
        cell.textLabel!.text = "CS 98/198"
        cell.detailTextLabel!.text = "iOS Decal"
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        if (indexPath.row == 0) {

            let controller = InstructorViewController()
            controller.view.reloadInputViews()
            self.present(controller, animated: true, completion: nil)
            
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
