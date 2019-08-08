//
//  ViewController.swift
//  FoodTracks
//
//  Created by Justin Vargas on 8/4/19.
//  Copyright © 2019 Justin Vargas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var gettingStarted: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gettingStarted.clipsToBounds = false
        gettingStarted.layer.cornerRadius = 20
    }


}

