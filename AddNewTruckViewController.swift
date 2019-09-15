//
//  AddNewTruckViewController.swift
//  FoodTracks
//
//  Created by Justin Vargas on 9/12/19.
//  Copyright © 2019 Justin Vargas. All rights reserved.
//

import UIKit

class AddNewTruckViewController: UIViewController {
    @IBOutlet weak var truckNameInput: UITextField!
    @IBOutlet weak var foodTypeInput: UITextField!
    @IBOutlet weak var priceSelectionInput: UISegmentedControl!
    @IBOutlet weak var add: UIButton!
    
    var truckName = ""
    var foodType = ""
    var priceSelection = "$"
    var segmentSelected = 0
//    var rating
//    var hours
    var lat = 0
    var lng = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addTruck(_ sender: Any) {
        truckName = truckNameInput.text ?? ""
        foodType = foodTypeInput.text ?? ""
        segmentSelected = priceSelectionInput.selectedSegmentIndex
        for _ in 0..<segmentSelected{
            priceSelection.append("$")
        }
    }
    
    

}
