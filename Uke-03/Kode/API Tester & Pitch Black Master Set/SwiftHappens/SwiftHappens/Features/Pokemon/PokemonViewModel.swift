//
//  PokemonViewModel.swift
//  SwiftHappens
//
//  Created by Ivan Lé Hjelmeland on 08/09/2026.
//

import Foundation
import Observation

@Observable
class PokemonViewModel {
    
    var cards: [PokemonCard] = []
    var isLoading: Bool = false
    var errorMessage: String?
    
    private let api = PokemonAPI()
    
    func loadCards() async {
        
        isLoading = true
        errorMessage = nil
        
        do {
            cards = try await api.fetchCards()
            print("Antall kort:", cards.count)
        } catch {
            errorMessage = "Kunne ikke hente Pokémon-kort"
        }
        
        isLoading = false
        
    }
}
