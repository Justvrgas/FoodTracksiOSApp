//
//  MapViewController.swift
//  FoodTracks
//
//  Created by Justin Vargas on 8/7/19.
//  Copyright © 2019 Justin Vargas. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
class MapViewController: UIViewController{

    @IBOutlet weak var searchBarContainer: UIView!
    @IBOutlet weak var mapView: MKMapView!
    
    var trucks = [FoodTrucks]()
    let  locationManager = CLLocationManager()
    let regionInMeters: Double = 50
    let annotation = MKPointAnnotation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBarContainer.clipsToBounds = false
        searchBarContainer.layer.cornerRadius = 10
        //map stuff
        checkLocationServices()
        centerViewOnUserLocation()
        //Call API for trucks
        NetworkingService.fetchAPI.getTruckList { (truck, status, error) in
            if status {
                if truck != nil{
                    self.trucks = truck!
                    print("Number of Trucks: \(self.trucks.count)")
                    self.showTrucks()
                }
            }else {
                    print("error")
                   }
        }
        
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "listView"
        {
            let vc = segue.destination as? ListViewController
            vc?.passedTruck = trucks
        }
        
    }
    
    
    @IBAction func listView(_ sender: Any) {
        print("list view button pressed")
        performSegue(withIdentifier: "listView", sender: Any?.self)
    }
    
   
    
    
    
    
    @IBAction func refreshTrucks(_ sender: Any) {
        NetworkingService.fetchAPI.getTruckList { (truck, status, error) in
            if status {
                if truck != nil{
                    self.trucks = truck!
                    print("Number of Trucks: \(self.trucks.count)")
                    self.showTrucks()
                    print("should show truck")

                }
            }else {
                    print("error")
                   }
        }
        
    }
    
    
    @IBAction func centerOnUser(_ sender: Any) {
        centerViewOnUserLocation()
        print("centering on user")
    }
    
    
    
    
    
    
    @IBAction func addMarker(_ sender: UILongPressGestureRecognizer) {
        if sender.state != UIGestureRecognizer.State.began { return }
        let touchLocation = sender.location(in: mapView)
        let locationCoordinate = mapView.convert(touchLocation, toCoordinateFrom: mapView)
        print("Tapped at lat: \(locationCoordinate.latitude) long: \(locationCoordinate.longitude)")
        annotation.coordinate = CLLocationCoordinate2D(latitude: locationCoordinate.latitude, longitude: locationCoordinate.longitude)
        mapView.addAnnotation(annotation)
        performSegue(withIdentifier: "addNewTruck", sender: Any?.self)
        
    }
    
    @IBAction func exitSearch(_ sender: Any) {
        searchBarContainer.endEditing(true)
    }
    
    
    func setupLocationManager(){
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func centerViewOnUserLocation(){
        if let location = locationManager.location?.coordinate{
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
            mapView.setRegion(region, animated: true )
        }
    }
    
    func checkLocationServices(){
        if CLLocationManager.locationServicesEnabled(){
            setupLocationManager()
            checkLocationAuth()
        }else{
            //TODO: Show user how to turn them back on
        }
    }
    
    func showTrucks(){
        for index in 0..<trucks.count{
           annotation.coordinate = CLLocationCoordinate2D(latitude: trucks[index].lat, longitude: trucks[index].lng)
           mapView.addAnnotation(annotation)
        }
    }
    
    func checkLocationAuth(){
        switch CLLocationManager.authorizationStatus(){
        case .authorizedWhenInUse:
            //do map stuff
            mapView.showsUserLocation = true
            centerViewOnUserLocation()
            break
        case .denied:
            let warningView = UILabel()
            warningView.text = "App will not work without location services. Enable them in your settings."
            mapView.addSubview(warningView)
            //show them alert how to turn them on or else app wont work
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            break
        case .restricted:
            //show them alert that someone is restricting their access not the app
            break
        case .authorizedAlways:
            mapView.showsUserLocation = true
            centerViewOnUserLocation()
            break
        @unknown default:
            fatalError()
        }
    }

}

extension MapViewController: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {return}
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
        mapView.setRegion(region, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuth()
    }
}

