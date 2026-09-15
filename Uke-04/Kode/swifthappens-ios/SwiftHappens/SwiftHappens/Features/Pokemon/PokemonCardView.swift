//
//  PokemonCardView.swift
//  SwiftHappens
//
//  Created by Ivan Lé Hjelmeland on 15/09/2026.
//

import SwiftUI

struct PokemonCardView: View {
    let card: PokemonCard
    
    @AppStorage private var isCollected: Bool
    
    init(card: PokemonCard, isCollected: Bool) {
        self.card = card
        self._isCollected = AppStorage(
            wrappedValue: false,
            "collected_\(card.id)"
        )
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            
            ZStack(alignment: .topTrailing) {
                PokemonCardImageView(imageURL: card.imageURL)
                
                if isCollected == true {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.title2)
                        .foregroundStyle(.green)
                        .background(.white, in: Circle())
                        .padding(6)
                        
                }
            }
            
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
        .contentShape(Rectangle())
        .sensoryFeedback(.success, trigger: isCollected)
        .onTapGesture {
            isCollected.toggle()
            print("Vi eier dette kortet: \(isCollected)")
        }
    }
}

#Preview {
    PokemonCardView(card: PokemonCard(id: "001", name: "Pikachu", number: "001", rarity: "Rare", variant: "Holo", imageURL: ""), isCollected: false)
}
