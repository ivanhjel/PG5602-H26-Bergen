//
//  PokemonAPI.swift
//  SwiftHappens
//
//  Created by Ivan Lé Hjelmeland on 08/09/2026.
//

import Foundation

struct PokemonAPI {
    
    func fetchCards() async throws -> [PokemonCard] {
        
        // Sjekk om urlen er gyldig før vi forsøker å gjøre nettverskall.
        guard let url = URL(string: "https://aboveapps.no/pitchblack/cards.json") else {
            throw URLError(.badURL)
        }
        
        // Gjør nettverskallet for urlen vår.
        let (data, response) = try await URLSession.shared.data(from: url)
        
        // Sjekk om responsen er gyldig (mellom 200 og 300).
        guard let response = response as? HTTPURLResponse, 200..<300 ~= response.statusCode else {
            throw URLError(.badServerResponse)
        }
        
        print("Bytes mottatt:", data.count)
        
        // Decode data til objektene våre
        let cards = try JSONDecoder().decode([PokemonCard].self, from: data)
        
        return cards
    }
}
