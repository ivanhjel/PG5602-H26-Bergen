//
//  NRKRadioView.swift
//  Student-Challenge
//
//  Created by Ivan Lé Hjelmeland on 06/10/2026.
//

import SwiftUI

struct NRKRadioView: View {

    let stations = [
        "NRK P1",
        "NRK P2",
        "NRK P3",
        "NRK mP3",
        "NRK Jazz"
    ]

    var body: some View {
        NavigationStack {
            List {
                ForEach(stations, id: \.self) { station in
                    HStack {
                        Image(systemName: "radio.fill")

                        Text(station)
                    }
                }
            }
            .navigationTitle("NRK Radio")
            .toolbarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    NRKRadioView()
}
