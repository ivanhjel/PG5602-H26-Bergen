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
            
            Tab("Tickets", systemImage: "bus.fill") {
                NavigationStack {
                    TicketsView()
                }
            }
            
            Tab("Popcorn", systemImage: "popcorn") {
                NavigationStack {
                    MoviesView()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
