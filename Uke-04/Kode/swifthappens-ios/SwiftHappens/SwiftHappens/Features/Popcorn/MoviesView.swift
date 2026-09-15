//
//  MoviesView.swift
//  SwiftHappens
//
//  Created by Ivan Lé Hjelmeland on 01/09/2026.
//

import SwiftUI

struct MoviesView: View {
    var body: some View {
        List {
            
            Section("Featured") {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(movies.shuffled().prefix(3)) { movie in
                            
                            NavigationLink {
                                MovieDetailsView(movie: movie)
                            } label: {
                                VStack(alignment: .leading, spacing: 8) {
                                    MoviePosterView(posterURL: movie.posterURL)
                                        .frame(width: 140, height: 210)
                                    
                                    Text(movie.title)
                                        .font(.headline)
                                        .lineLimit(1)
                                    
                                    Label {
                                        Text("\(movie.rating, specifier: "%.1f")")
                                    } icon: {
                                        Image(systemName: "star.fill")
                                            .foregroundStyle(.yellow)
                                    }
                                    .font(.caption)
                                    
                                    
                                }
                                .frame(width: 140, alignment: .leading)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
                .listRowInsets(
                    EdgeInsets(
                        top: 8,
                        leading: 16,
                        bottom: 8,
                        trailing: 16)
                )
            }
            
            Section("All Films") {
                ForEach(movies) { movie in
                    NavigationLink {
                        MovieDetailsView(movie: movie)
                    } label: {
                        HStack(spacing: 16) {
                            MoviePosterView(posterURL: movie.posterURL)
                                .frame(width: 70, height: 105)
                            
                            VStack(alignment: .leading, spacing: 6) {
                                Text(movie.title)
                                    .font(.headline)
                                
                                Text(String(movie.year))
                                    .font(.subheadline)
                                    .foregroundStyle(.secondary)
                                
                                Label {
                                    Text("\(movie.rating, specifier: "%.1f")")
                                } icon: {
                                    Image(systemName: "star.fill")
                                        .foregroundStyle(.yellow)
                                }
                                .font(.caption)

                            }
                        }
                        .padding(.vertical, 4)
    
                    }
                }
            }
            
        }
        .navigationTitle("Popcorn")
    }
}

#Preview {
    NavigationStack {
        MoviesView()
    }
}
