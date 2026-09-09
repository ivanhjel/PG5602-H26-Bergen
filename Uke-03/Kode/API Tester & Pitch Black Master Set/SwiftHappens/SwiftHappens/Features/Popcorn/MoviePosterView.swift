//
//  MoviePosterView.swift
//  SwiftHappens
//
//  Created by Ivan Lé Hjelmeland on 01/09/2026.
//

import SwiftUI

struct MoviePosterView: View {
    
    let posterURL: String
    
    var body: some View {
        AsyncImage(url: URL(string: posterURL)) { img in
            img
                .resizable()
                .scaledToFill()
        } placeholder: {
            ZStack {
                Color.gray.opacity(0.15)
                
                ProgressView()
            }
        }
        .clipped()
        .cornerRadius(12)
    }
}

#Preview {
    let posterURL = "https://media.themoviedb.org/t/p/w440_and_h660_face/xlaY2zyzMfkhk0HSC5VUwzoZPU1.jpg"
    MoviePosterView(posterURL: posterURL)
        .frame(width: 80, height: 220)
}
