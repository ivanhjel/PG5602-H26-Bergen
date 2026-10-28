//
//  MapView.swift
//  MapMapMap
//
//  Created by Ivan Lé Hjelmeland on 27/10/2026.
//

import SwiftUI
import MapKit
import CoreLocation

struct MapView: View {
    
    // En manager som henter posisjonen til bruker fra GPS
    @State private var locationManager = CLLocationManager()
    
    // Posisjonen for Bergen sentrum med en radius
    @State private var cameraPosition: MapCameraPosition = .userLocation(fallback:      MapCameraPosition.region(
        
            MKCoordinateRegion(
                center: CLLocationCoordinate2D(
                    latitude: 60.3913,
                    longitude: 5.3221
                ),
                span: MKCoordinateSpan(
                    latitudeDelta: 0.08,
                    longitudeDelta: 0.08
                )
            )
        )
    )
    
    var body: some View {
        
        Map(initialPosition: cameraPosition) {
            UserAnnotation()
            
            MapCircle(center: CLLocationCoordinate2D(latitude: 60.3590, longitude: 5.3430), radius: 500)
                .foregroundStyle(.blue.opacity(0.2))
                .stroke(.blue, lineWidth: 2)
            
            Annotation("Fløyen", coordinate: CLLocationCoordinate2D(latitude: 60.3590, longitude: 5.3430)) {
                Text("🎾")
                    .font(.largeTitle)
            }
            
            //MapPolyline(coordinates: [CLLocationCoordinate2D(latitude: 60.3590, longitude: 5.3430), CLLocationCoordinate2D(latitude: 60.3970, longitude: 5.3240)])
                //.stroke(.red)
            
            
            
            
            
        }
        .mapStyle(.standard)
        .mapControls {
            MapUserLocationButton()
            MapCompass()
            MapPitchToggle()
            MapScaleView()
        }
        .onAppear {
            if locationManager.authorizationStatus == .notDetermined {
                locationManager.requestWhenInUseAuthorization()
            }
        }
        
    }
}

#Preview {
    MapView()
}
