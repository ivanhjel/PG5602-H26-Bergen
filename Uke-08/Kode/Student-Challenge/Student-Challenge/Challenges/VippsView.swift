//
//  VippsView.swift
//  Student-Challenge
//
//  Created by Ivan Lé Hjelmeland on 06/10/2026.
//

import Foundation
import SwiftUI

struct VippsView: View {

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "person.circle.fill")
                .font(.system(size: 60))

            Text("Silje")
                .font(.title)

            Text("250 kr")
                .font(.title2)
                .bold()
            
            Spacer()

            Button("Betal") {
                print("Betaling på 250 kr sendt til Silje")
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            
        }
        .padding()
    }
}

#Preview {
    VippsView()
}
