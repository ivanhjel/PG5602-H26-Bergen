//
//  TrumfView.swift
//  Student-Challenge
//
//  Created by Ivan Lé Hjelmeland on 06/10/2026.
//

import SwiftUI

struct TrumfView: View {

    @State private var points = 1240

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "star.circle.fill")
                .font(.system(size: 60))

            Text("Din Trumf-bonus")
                .font(.headline)

            Text("\(points) poeng")
                .font(.largeTitle)
                .bold()

            Button("Registrer 10 poeng") {
                points += 10
                print("Du har nå \(points) poeng")
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.extraLarge)
        }
        .padding()
    }
}

#Preview {
    TrumfView()
}
