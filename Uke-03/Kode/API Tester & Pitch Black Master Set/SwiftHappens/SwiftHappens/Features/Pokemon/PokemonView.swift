//
//  PokemonView.swift
//  SwiftHappens
//
//  Created by Ivan Lé Hjelmeland on 08/09/2026.
//

import SwiftUI

struct PokemonView: View {
    
    @State private var viewModel = PokemonViewModel()
    
    private let columns = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10)
    ]
    
    var body: some View {
        
        Group {
            
            // Hvis viewmodel laster data....
            if viewModel.isLoading {
                ProgressView()
            } else if let errorMessage = viewModel.errorMessage {
                // eller det finnes en feilmelding.....
                ContentUnavailableView("Noe gikk galt", systemImage: "exclamationmark.triangle.fill", description: Text(errorMessage))
            } else {
                // eller hvis alt gikk bra...
                cardGrid
            }
            
        }
        .navigationTitle("Pitch Black")
        .task {
            await viewModel.loadCards()
        }
    }
    
    private var cardGrid: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(viewModel.cards) { card in
                    pokemonCard(card: card)
                }
            }
            .padding(.horizontal, 12)
            .padding(.vertical)
        }
    }
    
    private func pokemonCard(card: PokemonCard) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            PokemonCardImageView(imageURL: card.imageURL)
            
            Text(card.name)
                .font(.subheadline)
                .fontWeight(.semibold)
                .lineLimit(1)
                .minimumScaleFactor(0.7)
            
            Text("#\(card.number)")
                .font(.caption)
                .foregroundStyle(.secondary)
            
            Text(card.variant)
                .font(.caption2)
                .foregroundStyle(.secondary)
                .lineLimit(1)
                .minimumScaleFactor(0.7)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    NavigationStack {
        PokemonView()
    }
}
