//
//  NetworkingService.swift
//  FoodTracks
//
//  Created by Justin Vargas on 8/14/19.
//  Copyright © 2019 Justin Vargas. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
typealias ListingTrucks = (_ trucks: [FoodTrucks]?,_ status : Bool,_ error :Error?)->()

class NetworkingService{
    static let shared = NetworkingService()
    private init() {}
//
    var trucks = [FoodTrucks]()
    
    struct fetchAPI {
        
        static func getTruckList(completion: @escaping ListingTrucks){
            
            Alamofire.request("https://foodtrucksrestapi.herokuapp.com/food-trucks", method: .get, encoding: JSONEncoding.default).responseJSON
                { response in
                
                switch response.result {
                    
                case .success(let data) :
                     
                    print("response: ", response)
                    let json = JSON(data)  //creating a variable of the JSON data
                    let pickListJsonArr = json["results"].arrayValue //creating an array of the data that is in the response
                    var pickListArr = [FoodTrucks]() //each item in the pickListJsonArr is a video object

                    for pickList in pickListJsonArr{
                        
                        if let _id = pickList["_id"].string, let username = pickList["username"].string, let truckName = pickList["truckName"].string, let type = pickList["type"].string, let lat = pickList["lat"].double, let lng = pickList["lng"].double, let stars = pickList["stars"].int, let reviewsAmount = pickList["reviewsAmount"].int, let priceRating = pickList["priceRating"].int{
                            
                            let truck = FoodTrucks(_id: _id, username: username, truckName: truckName, type: type, lat: lat, lng: lng, stars: stars, reviewsAmount: reviewsAmount, priceRating: priceRating)
                             
                            pickListArr.append(truck)
                         }
                         
                     }

                 completion(pickListArr.reversed(),true, nil)

                 case .failure(let error) :
                     print(error)
                     completion(nil, false, error)
                 }

                 let statusCode = (response.response?.statusCode)!
                 print("Status Code: \(statusCode)")
    
    
            }
            
            
        }
        
        
        
        
    }
    
    

}
