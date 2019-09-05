//
//  ListViewController.swift
//  FoodTracks
//
//  Created by Justin Vargas on 8/18/19.
//  Copyright © 2019 Justin Vargas. All rights reserved.
//

import UIKit

class listCells: UITableViewCell{
    @IBOutlet weak var truckName: UILabel!
    @IBOutlet weak var priceRating: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var reviewsCount: UILabel!
    @IBOutlet weak var truckLogo: UIImageView!
    
}


class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var passedTruck = [FoodTrucks]()
    @IBOutlet weak var tableView: UITableView!
    var chosenTruck = FoodTrucks()
    override func viewDidLoad() {
        super.viewDidLoad()
        print("passed trucks count: \(passedTruck.count)")
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "truckChosen"
        {
            let vc = segue.destination as? TruckInfoViewController
            vc?.truck = chosenTruck
        }
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return passedTruck.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cells", for: indexPath) as! listCells
        var price: String = ""
        var stars: String = ""
        print("price rating for index \(indexPath.row): \(passedTruck[indexPath.row].priceRating)")
        for _ in 0..<passedTruck[indexPath.row].priceRating{
            price.append("$")
        }
        for _ in 0..<passedTruck[indexPath.row].stars{
            stars.append("⭐️")
        }
        cell.truckName.text = passedTruck[indexPath.row].truckName
        cell.priceRating.text = price
        cell.rating.text = stars
        cell.reviewsCount.text = String("(\(passedTruck[indexPath.row].reviewsAmount))")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = 120
        return CGFloat(height)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenTruck = passedTruck[indexPath.row]
        performSegue(withIdentifier: "truckChosen", sender: chosenTruck)
    }

}
