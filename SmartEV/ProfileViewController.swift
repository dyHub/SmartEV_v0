//
//  ProfileViewController.swift
//  SmartEV
//
//  Created by Yuhan Dai on 6/20/16.
//  Copyright © 2016 Yuhan Dai. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    // MARK: Outlets
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    // Data model: These strings will be the data for the table view cells
    let InfoTitle: [String] = ["Car Model", "Total Mileage", "Remaining Mileage", "Battery"]
    let InfoDetail: [String] = ["Leaf", "75", "40", "60%"]
    
    // cell reuse id (cells that scroll out of view can be reused)
    let cellReuseIdentifier = "profileInfoCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // customize profile image
        self.profileImage.layer.borderWidth = 2.0
        self.profileImage.layer.borderColor = UIColor.whiteColor().CGColor
        
        // set the profile image to be circular
        self.profileImage.layer.cornerRadius = self.profileImage.frame.height/2
        self.profileImage.clipsToBounds = true
        
        
        // Register the table view cell class and its reuse id
        //self.tableView.registerClass(ProfileInfoCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        //self.tableView.registerNib(UINib(nibName: "ProfileInfoCell", bundle: nil), forCellReuseIdentifier: cellReuseIdentifier)
        
        // This view controller itself will provide the delegate methods and row data for the table view.
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
    }
    
    
    // number of rows in table view
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.InfoTitle.count
    }
    
    // create a cell for each table view row
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // create a new cell if needed or reuse an old one
        let cell: ProfileInfoCell = tableView.dequeueReusableCellWithIdentifier(cellReuseIdentifier, forIndexPath: indexPath) as! ProfileInfoCell
        
        // set the text from the data model
        cell.TitleLabel.text = self.InfoTitle[indexPath.row]
        cell.DetailLabel.text = self.InfoDetail[indexPath.row]
        
        return cell
    }
    
    // method to run when table view cell is tapped
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("You tapped cell number \(indexPath.row).")
    }
}
