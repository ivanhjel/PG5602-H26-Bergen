//
//  ContentView.swift
//  SwiftHappens
//
//  Created by Ivan Lé Hjelmeland on 24/08/2026.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        
        TabView {
            Tab("Profil", systemImage: "graduationcap") {
                NavigationStack {
                    ProfileView()
                }
            }
            
            Tab("B", systemImage: "heart") {
                Text("Her kommer det noe snart")
            }
            
            Tab("C", systemImage: "questionmark") {
                Text("Her kommer det noe snart")
            }
        }
    }
}

#Preview {
    ContentView()
}
