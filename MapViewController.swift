//
//  MapViewController.swift
//  FoodTracks
//
//  Created by Justin Vargas on 8/7/19.
//  Copyright © 2019 Justin Vargas. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    fileprivate let locationManager:CLLocationManager = CLLocationManager()
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var searchBarContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Asks user to display their location on the APP
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.startUpdatingLocation()
        mapView.showsUserLocation = true
        //centers the map to the users location
        let latitude:CLLocationDegrees = (locationManager.location?.coordinate.latitude)!
        let longitude:CLLocationDegrees = (locationManager.location?.coordinate.longitude)!
        let latDelta:CLLocationDegrees = 0.05
        let lonDelta:CLLocationDegrees = 0.05
        let span = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
        let location = CLLocationCoordinate2DMake(latitude, longitude)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: false)
        //round the search bar container
        searchBarContainer.clipsToBounds = false
        searchBarContainer.layer.cornerRadius = 10
    }

}
