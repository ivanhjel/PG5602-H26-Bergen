//
//  PokemonCard.swift
//  SwiftHappens
//
//  Created by Ivan Lé Hjelmeland on 08/09/2026.
//

import Foundation

struct PokemonCard: Identifiable, Decodable {
    let id: String
    let name: String
    let number: String
    let rarity: String
    let variant: String
    let imageURL: String
}
