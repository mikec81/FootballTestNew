//
//  MapView.swift
//  FootballApp3
//
//  Created by mikecurtis on 18/06/2019.
//  Copyright © 2019 Michael Curtis. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable
{//Open Stuct
    
    // Set Varibles
    
    var MapLong : Double
    var MapLat : Double
    var PinName: String
    
    func makeUIView(context: Context) -> MKMapView
    { // Open makeUIView
    
        
        MKMapView(frame: .zero)
    
    }// Close makeUKView
    
     func updateUIView(_ view: MKMapView,context: Context) {
        let ClubMapPin = MKPointAnnotation()
        ClubMapPin.title = PinName
        let coordinate = CLLocationCoordinate2D(
            latitude: MapLat, longitude: MapLong)
        let span = MKCoordinateSpan(latitudeDelta: 0.0095, longitudeDelta: 0.0095)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        ClubMapPin.coordinate = coordinate
        view.addAnnotation(ClubMapPin)
        view.setRegion(region, animated: false)
     }// close updateUIView
}//Close Struct


struct MapView_Previews : PreviewProvider {
    static var previews: some View {
        MapView(MapLong:-2.29139,MapLat: 53.4631,PinName: "Man Utd")}
}


