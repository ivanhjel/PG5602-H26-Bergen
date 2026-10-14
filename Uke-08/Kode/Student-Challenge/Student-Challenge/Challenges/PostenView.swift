//
//  PostenView.swift
//  Student-Challenge
//
//  Created by Ivan Lé Hjelmeland on 06/10/2026.
//

import SwiftUI

struct PostenView: View {

    var body: some View {
        VStack(spacing: 24) {

            HStack(spacing: 16) {
                Image(systemName: "shippingbox.fill")
                    .font(.largeTitle)

                VStack(alignment: .leading, spacing: 6) {
                    Text("Klar til henting")
                        .font(.headline)

                    Text("MENY Bergen Storsenter")
                        .foregroundStyle(.secondary)
                }

                Spacer()
            }

            Button("Vis sporingsnummer") {
                print("PK948201")
            }
            .buttonStyle(.bordered)
        }
        .padding()
        .background(.black.opacity(0.1))
    }
}

#Preview {
    PostenView()
}
