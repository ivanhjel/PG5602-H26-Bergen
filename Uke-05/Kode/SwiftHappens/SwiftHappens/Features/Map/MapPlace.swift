//
//  MapPlace.swift
//  SwiftHappens
//
//  Created by Ivan Lé Hjelmeland on 21/09/2026.
//

import SwiftUI
import CoreLocation

struct MapPlace: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
    let symbol: String
    let color: Color
}
