//
//  NorskTippingView.swift
//  Student-Challenge
//
//  Created by Ivan Lé Hjelmeland on 06/10/2026.
//

import Foundation
import SwiftUI

struct FootballMatch: Identifiable {
    let id = UUID()

    let homeTeam: String
    let awayTeam: String
    let homeScore: Int
    let awayScore: Int
}

struct NorskTippingView: View {

    let matches = [
        FootballMatch(
            homeTeam: "Brann",
            awayTeam: "Viking",
            homeScore: 3,
            awayScore: 1
        ),
        FootballMatch(
            homeTeam: "Rosenborg",
            awayTeam: "Molde",
            homeScore: 1,
            awayScore: 1
        ),
        FootballMatch(
            homeTeam: "Bodø/Glimt",
            awayTeam: "Tromsø",
            homeScore: 0,
            awayScore: 2
        )
    ]

    func result(for match: FootballMatch) -> String {
        if match.homeScore > match.awayScore {
            return "Hjemmeseier"
        } else if match.awayScore > match.homeScore {
            return "Borteseier"
        } else {
            return "Uavgjort"
        }
    }

    var body: some View {
        NavigationStack {
            List(matches) { match in
                VStack(alignment: .leading, spacing: 6) {
                    Text(
                        "\(match.homeTeam) \(match.homeScore) - \(match.awayScore) \(match.awayTeam)"
                    )
                    .font(.headline)

                    Text(result(for: match))
                        .foregroundStyle(.secondary)
                }
            }
            .navigationTitle("Resultater")
        }
    }
}

#Preview {
    NorskTippingView()
}
