//
//  MapView.swift
//  LocalAssist
//
//  Created by Phillip on 06.10.2024.
//

import SwiftUI
import MapKit

struct MapView: View {
    var body: some View {
        ZStack {
            
        }
    }
}

#Preview {
    MapView()
}

struct MapViewRepresentable: UIViewRepresentable {
    // A coordinate for the center of the map
    let coordinate: CLLocationCoordinate2D
    
    // Step 2: Create the MKMapView and set its region
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        let region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        )
        mapView.setRegion(region, animated: true)
        return mapView
    }
    
    // Step 3: Update the MKMapView if needed
    func updateUIView(_ uiView: MKMapView, context: Context) {
        // You can update the map here if needed
    }
}
