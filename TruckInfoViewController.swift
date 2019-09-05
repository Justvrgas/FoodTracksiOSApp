//
//  TruckInfoViewController.swift
//  
//
//  Created by Justin Vargas on 9/5/19.
//

import UIKit

class TruckInfoViewController: UIViewController {

    var truck = FoodTrucks()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        truckName.text = truck.truckName
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var truckName: UILabel!
    


}
