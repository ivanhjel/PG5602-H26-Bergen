//
//  EggTimerView.swift
//  EggTimer
//
//  Created by Ivan Lé Hjelmeland on 13/10/2026.
//

import SwiftUI

struct EggTimerView: View {
    
    @State private var viewModel = EggTimerViewModel()
    
    var body: some View {
        VStack(spacing: 24) {

            
            Image(viewModel.selectedEgg.imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 180)
            
            Text(viewModel.selectedEgg.rawValue)
                .font(.largeTitle)
                .fontWeight(.semibold)
            Text(viewModel.selectedEgg.cookingTime)
                .font(.system(size: 80))
                .bold()
            
            Spacer()
            
            Picker("Velg egg", selection: $viewModel.selectedEgg) {
                ForEach(EggType.allCases, id: \.self) { type in
                    Text(type.rawValue)
                        .tag(type)
                }
            }
            .pickerStyle(.segmented)
        }
        .padding()
    }
}

#Preview {
    EggTimerView()
}
