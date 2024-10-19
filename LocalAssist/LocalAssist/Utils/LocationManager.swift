//
//  LocationManager.swift
//  LocalAssist
//
//  Created by Phillip on 15.10.2024.
//

import Foundation
import MapKit

@MainActor
class LocationManager: NSObject, ObservableObject {
    @Published var location: CLLocation?
    @Published var region = MKCoordinateRegion()
    @Published var cityName: String = "Unknown Location"
    
    private let locationManager = CLLocationManager()
    private let geocoder = CLGeocoder()
    
    override init() {
        super.init()
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.delegate = self
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.location = location
        
        geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
            if let error = error {
                print("Geocoding error: \(error)")
                return
            }
            if let placemark = placemarks?.first, let city = placemark.locality {
                self.cityName = city
            } else {
                self.cityName = "Unknown Location"
            }
        }
        
        let offsetLatitude = location.coordinate.latitude - 0.0035
        
        self.region = MKCoordinateRegion(center: CLLocationCoordinate2D(
            latitude: offsetLatitude,
            longitude: location.coordinate.longitude),
            latitudinalMeters: 1200,
            longitudinalMeters: 1200
        )
    }
}
