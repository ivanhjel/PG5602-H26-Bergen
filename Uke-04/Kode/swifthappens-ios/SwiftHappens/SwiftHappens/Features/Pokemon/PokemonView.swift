//
//  PokemonView.swift
//  SwiftHappens
//
//  Created by Ivan Lé Hjelmeland on 08/09/2026.
//

import SwiftUI

struct PokemonView: View {
    
    @State private var viewModel = PokemonViewModel()
    
    @State private var searchText = ""
    
    private let columns = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10)
    ]
    
    private var filteredCards: [PokemonCard] {
        guard !searchText.isEmpty else {
            return viewModel.cards
        }
        
        return viewModel.cards.filter { card in
            card.name.localizedCaseInsensitiveContains(searchText)
        }
    }
    
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
        .searchable(text: $searchText, prompt: "Søk på navn")
        .task {
            await viewModel.loadCards()
        }
    }
    
    private var cardGrid: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(filteredCards) { card in
                    PokemonCardView(card: card, isCollected: false)
                }
            }
            .padding(.horizontal, 12)
            .padding(.vertical)
        }
    }
}

#Preview {
    NavigationStack {
        PokemonView()
    }
}
