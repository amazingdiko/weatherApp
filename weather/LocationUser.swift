//
//  LocationUser.swift
//  weather
//
//  Created by Vitaliy Plaschenkov on 27.11.2022.
//

import UIKit
import CoreLocation


extension ViewController: CLLocationManagerDelegate {

    func startLocationManager(){
        locationManager.requestWhenInUseAuthorization()

        if CLLocationManager.locationServicesEnabled(){
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
            locationManager.startUpdatingLocation()
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let lastCoordinate = locations.last {
            updateWeatherInfo(latitude: lastCoordinate.coordinate.latitude, longtitude: lastCoordinate.coordinate.longitude)
            print(lastCoordinate.coordinate.latitude, lastCoordinate.coordinate.longitude)
        }
    }
}
