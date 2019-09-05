//
//  SettingsViewController.swift
//  FoodTracks
//
//  Created by Justin Vargas on 8/10/19.
//  Copyright © 2019 Justin Vargas. All rights reserved.
//

import UIKit

class settingsCell: UITableViewCell{
    
    @IBOutlet weak var settingLabel: UILabel!
}

class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let settingChoices = ["Email Notifications", "Push Notifications", "Linked Accounts", "Privacy Settings", "My Locations", "Clear History", "Log Out"]
    
    var choice = 0
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingChoices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! settingsCell
        cell.settingLabel.text = settingChoices[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "settingsChosen", sender: settingChoices[indexPath.row])
    }
    
    
    
    

}
