//
//  FinnView.swift
//  Student-Challenge
//
//  Created by Ivan Lé Hjelmeland on 06/10/2026.
//

import Foundation
import SwiftUI

struct FinnListing: Identifiable {
    let id = UUID()

    let title: String
    let price: Int
    let location: String
}

struct FinnView: View {

    let listings = [
        FinnListing(
            title: "MacBook Pro",
            price: 18_000,
            location: "Bergen"
        ),
        FinnListing(
            title: "Sofa",
            price: 4_500,
            location: "Oslo"
        ),
        FinnListing(
            title: "Sykkel",
            price: 7_900,
            location: "Trondheim"
        )
    ]

    var body: some View {
        NavigationStack {
            List(listings) { listing in
                VStack(alignment: .leading, spacing: 5) {
                    Text(listing.title)
                        .font(.headline)

                    Text("\(listing.price) kr")

                    Text(listing.location)
                        .foregroundStyle(.secondary)
                }
            }
            .navigationTitle("FINN")
        }
    }
}

#Preview {
    FinnView()
}
