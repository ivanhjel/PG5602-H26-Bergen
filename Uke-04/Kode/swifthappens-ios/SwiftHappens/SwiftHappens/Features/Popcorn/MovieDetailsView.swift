//
//  MovieDetailsView.swift
//  SwiftHappens
//
//  Created by Ivan Lé Hjelmeland on 01/09/2026.
//

import SwiftUI

struct MovieDetailsView: View {
    let movie: Movie
    
    var body: some View {
        Form {
            
            // MARK: - Poster View
            
            Section {
                HStack {
                    Spacer()
                    
                    MoviePosterView(posterURL: movie.posterURL)
                        .frame(width: 100, height: 270)
                    
                    Spacer()
                }
            }
            .listRowBackground(Color.clear)
            
            Section("About") {
                
                HStack {
                    Text("Title")
                    
                    Spacer()
                    
                    Text(movie.title)
                        .foregroundStyle(.secondary)
                }
                
                HStack {
                    Text("Year")
                    
                    Spacer()
                    
                    Text(String(movie.year))
                        .foregroundStyle(.secondary)
                }
                
                HStack {
                    Text("Rating")
                    
                    Spacer()
                    
                    Label {
                        Text("\(movie.rating, specifier: "%.1f")")
                            .foregroundStyle(.secondary)
                    } icon: {
                        Image(systemName: "star.fill")
                            .foregroundStyle(.yellow)
                    }
                    
                }
            }
            
            Section("Overview") {
                Text(movie.summary)
            }
            
            Section("Actors") {
                ForEach(movie.actors, id: \.self) { actor in
                    Text(actor)
                }
            }
        }
        .navigationTitle(movie.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let movie = movies.first!
    MovieDetailsView(movie: movie)
}
