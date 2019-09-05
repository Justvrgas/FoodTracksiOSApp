//
//  FoodTrucks.swift
//  
//
//  Created by Justin Vargas on 8/14/19.
//

import Foundation
import SwiftyJSON
//"_id": "0",
//"username": "jvargas",
//"truckName": "Bella Luna",
//"type": "Italian",
//"lat": 37.758155,
//"lng": -121.461069,
//"realName": "Bella Lunitza",
//"stars": 4,
//"reviewsAmount": 200,
//"priceRating": 3


struct FoodTrucks{
        
//        var videoUrl: String
    var _id: String
    var username: String
    var truckName: String
    var type: String
    var lat: Double
    var lng: Double
    var stars: Int
    var reviewsAmount: Int
    var priceRating: Int
    
    init(json:JSON) {
//            self.videoUrl = json["name"].stringValue
        self._id = json["_id"].stringValue
        self.username = json["username"].stringValue
        self.truckName = json["truckName"].stringValue
        self.type = json["type"].stringValue
        self.lat = json["lat"].doubleValue
        self.lng = json["lng"].doubleValue
        self.stars = json["stars"].intValue
        self.reviewsAmount = json["reviewsAmount"].intValue
        self.priceRating = json["priceRating"].intValue
    }
        
    init(_id:String, username:String, truckName:String, type:String, lat:Double, lng:Double, stars:Int, reviewsAmount:Int, priceRating:Int){
//            self.videoUrl = videoUrl
            self._id = _id
            self.username = username
            self.truckName = truckName
            self.type = type
            self.lat = lat
            self.lng = lng
            self.stars = stars
            self.reviewsAmount = reviewsAmount
            self.priceRating = priceRating
            
        }
        
        init() {
//            self.videoUrl = ""
            self._id = ""
            self.username = ""
            self.truckName = ""
            self.type = ""
            self.lat = 0
            self.lng = 0
            self.stars = 0
            self.reviewsAmount = 0
            self.priceRating = 0
        }
        
        
}


