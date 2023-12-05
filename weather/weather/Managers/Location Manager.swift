//
//  Location Manager.swift
//  weather
//
//  Created by user243761 on 11/19/23.
//

import Foundation //base of swift app
import CoreLocation //user geographical location

//make class NSObject interacct wuth API of CLLocationManager. ObservableObject enable SwiftUI views observe changes. 
//Implement CLLocationManagerDelegate respond to location updates, errors
class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    //manage location events
    let manager = CLLocationManager()
    
    //stores current user location
    @Published var location: CLLocationCoordinate2D?
    //check wether location request in progress
    @Published var isLoading = false
    
    override init() {
        super.init()
        
     
        manager.delegate = self
    }
    
    func requestLocation() {
        isLoading = true
        manager.requestLocation()
    }
    
    // Set the location coordinates to the location variable
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
        isLoading = false
    }
    
    
    // This function will be called if we run into an error
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error getting location", error)
        isLoading = false
    }
}
