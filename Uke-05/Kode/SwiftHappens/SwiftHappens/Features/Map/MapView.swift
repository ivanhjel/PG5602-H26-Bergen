//
//  MapView.swift
//  SwiftHappens
//
//  Created by Ivan Lé Hjelmeland on 21/09/2026.
//

import SwiftUI
import MapKit // Verktøy for å bruke kart
import CoreLocation // Vertkyø for å hente koordinater fra GPS

struct MapView: View {
    
    @State private var locationManager = CLLocationManager()
    
    @State private var position: MapCameraPosition = .region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(
                latitude: 60.39299,
                longitude: 5.3415
            ),
            span: MKCoordinateSpan(
                latitudeDelta: 0.08,
                longitudeDelta: 0.08
            )
        )
    )
    
    private let places = [
        MapPlace(
            name: "Bryggen",
            coordinate: CLLocationCoordinate2D(
                latitude: 60.397146,
                longitude: 5.322735
            ),
            symbol: "heart.fill",
            color: .blue
        ),
        MapPlace(
            name: "Fløyen",
            coordinate: CLLocationCoordinate2D(
                latitude: 60.39389,
                longitude: 5.34541
            ),
            symbol: "mountain.2.fill",
            color: .red
        ),
        MapPlace(
            name: "Ulriken",
            coordinate: CLLocationCoordinate2D(
                latitude: 60.37674,
                longitude: 5.39343
            ),
            symbol: "mountain.2.fill",
            color: .blue
        )
    ]
    
    var body: some View {
        Map(position: $position) {
            ForEach(places) { place in
                Marker(
                    place.name,
                    systemImage: place.symbol,
                    coordinate: place.coordinate
                )
                .tint(place.color)
            }
            
            UserAnnotation()
        }
        .mapStyle(.hybrid)
        .mapControls {
            MapUserLocationButton()
            MapCompass()
            MapScaleView()
        }
        .onAppear {
            locationManager.requestWhenInUseAuthorization()
        }
    }
}

#Preview {
    MapView()
}
