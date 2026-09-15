//
//  PokemonCardImageView.swift
//  SwiftHappens
//
//  Created by Ivan Lé Hjelmeland on 08/09/2026.
//

import SwiftUI

struct PokemonCardImageView: View {
    
    let imageURL: String
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.12)
            
            AsyncImage(url: URL(string: imageURL)) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
        }
        .aspectRatio(0.72, contentMode: .fit)
        .cornerRadius(8)

    }
}

#Preview {
    PokemonCardImageView(imageURL: "https://aboveapps.no/pitchblack/me5-1.png")
        .frame(width: 120)
}
