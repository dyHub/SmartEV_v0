//
//  ChooseCarViewController.swift
//  SmartEV
//
//  Created by Yuhan Dai on 6/21/16.
//  Copyright © 2016 Yuhan Dai. All rights reserved.
//

import UIKit

class ChooseCarViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var CarImageView: UIImageView!
    @IBOutlet weak var RightSelect: UIImageView!
    @IBOutlet weak var LeftSelect: UIImageView!
    @IBOutlet weak var CarLabel: UILabel!
    
    // MARK: Properties
    // array of available cars
    var CarNames: [String] = [
        "Leaf",
        "TeslaM3",
        "Volt"
    ]
    
    // index for current showing car image
    var carIndex = 0
    
    // MARK: UIViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // initial first car
        updateCurrentCar()
        
        // set right select image tappable
        let rightTapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(ChooseCarViewController.rightArrowTapped(_:)))
        RightSelect.userInteractionEnabled = true
        RightSelect.addGestureRecognizer(rightTapGestureRecognizer)
        
        // set left select image tappable
        let leftTapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(ChooseCarViewController.leftArrowTapped(_:)))
        LeftSelect.userInteractionEnabled = true
        LeftSelect.addGestureRecognizer(leftTapGestureRecognizer)

    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
    }
    
    // MARK: Actions
    func rightArrowTapped(img: AnyObject){
        if (carIndex < CarNames.count - 1) {
            carIndex = carIndex + 1
            updateCurrentCar()
        }
    }
    
    func leftArrowTapped(img: AnyObject){
        if (carIndex > 0) {
            carIndex = carIndex - 1
            updateCurrentCar()
        }
    }
    
    func updateCurrentCar() {
        CarImageView.image = UIImage(named: CarNames[carIndex])
        CarImageView.frame = CGRectMake(0,0,300,200)
        CarLabel.text = CarNames[carIndex]
    }
    
    @IBAction func saveCarSelected(sender: AnyObject) {
        
    }
}
