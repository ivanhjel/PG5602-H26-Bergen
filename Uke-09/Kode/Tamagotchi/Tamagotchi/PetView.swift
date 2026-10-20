//
//  PetView.swift
//  Tamagotchi
//
//  Created by Ivan Lé Hjelmeland on 19/10/2026.
//

import Foundation
import SwiftUI

struct PetView: View {
    
    @State private var viewModel = PetViewModel()
    
    var body: some View {
        
        VStack(spacing: 24) {
            
            Text(viewModel.pet.name)
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text(viewModel.pet.emoji)
                .font(.system(size: 150))
            
            Text(viewModel.status())
                .font(.headline.monospaced())
            
            ProgressView("⚡️ Energi", value: Double(viewModel.pet.energy), total: 100.0)
                .tint(.red)
                .animation(.easeInOut, value: viewModel.pet.energy)

            ProgressView("❤️ Humør", value: Double(viewModel.pet.happiness), total: 100.0)
                .tint(.yellow)
                .animation(.easeInOut, value: viewModel.pet.happiness)
            
            Spacer()
            
            HStack {
                
                Button {
                    viewModel.play()
                } label: {
                    Text("🎾")
                        .font(.largeTitle)
                }
                
                Spacer()
                
                Button {
                    viewModel.feed()
                } label: {
                    Text("🍎")
                        .font(.largeTitle)
                }
                
                Spacer()
                
                Button {
                    viewModel.sleep()
                } label: {
                    Text("😴")
                        .font(.largeTitle)
                }
            }
            .padding(.horizontal, 50)
        }
        .frame(maxWidth: .infinity)
        .padding(50)
        .background(.brown.opacity(0.2).gradient)
    }
}

#Preview {
    PetView()
}
