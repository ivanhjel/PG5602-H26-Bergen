//
//  TV2PlayView.swift
//  Student-Challenge
//
//  Created by Ivan Lé Hjelmeland on 06/10/2026.
//

import Foundation
import SwiftUI

struct TVShow: Identifiable {
    let id = UUID()

    let title: String
    let seasons: Int
    let isFavorite: Bool
}

struct TV2PlayView: View {

    let shows = [
        TVShow(
            title: "Spillet",
            seasons: 2,
            isFavorite: true
        ),
        TVShow(
            title: "Kompani Lauritzen",
            seasons: 6,
            isFavorite: true
        ),
        TVShow(
            title: "Farmen",
            seasons: 20,
            isFavorite: false
        ),
        TVShow(
            title: "Hotel Cæsar",
            seasons: 34,
            isFavorite: false
        )
    ]

    var body: some View {
        NavigationStack {
            List {
                ForEach(shows.filter { $0.isFavorite }) { show in
                    VStack(alignment: .leading) {
                        Text(show.title)
                            .font(.headline)

                        Text("\(show.seasons) sesonger")
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .navigationTitle("Min liste")
        }
    }
}

#Preview {
    TV2PlayView()
}
