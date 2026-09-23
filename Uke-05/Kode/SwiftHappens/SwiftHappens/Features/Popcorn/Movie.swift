//
//  Movie.swift
//  SwiftHappens
//
//  Created by Ivan Lé Hjelmeland on 01/09/2026.
//

import SwiftUI

struct Movie: Identifiable {
    let id = UUID()
    
    let title: String
    let year: Int
    let posterURL: String
    let summary: String
    let rating: Double
    let actors: [String]
}

let movies: [Movie] = [
    Movie(title: "Inception", year: 2010, posterURL: "https://media.themoviedb.org/t/p/w220_and_h330_face/gqgwNjwjSqGkOqkE2rppogenu4v.jpg", summary: "Cobb, a skilled thief who commits corporate espionage by infiltrating the subconscious of his targets is offered a chance to regain his old life as payment for a task considered to be impossible: \"inception\", the implantation of another person's idea into a target's subconscious.", rating: 8.4, actors: ["Leonardo Di Caprio", "Joseph Gordon-Levitt", "Ken Watanabe"]),
    Movie(title: "No County for Old Men", year: 2007, posterURL: "https://media.themoviedb.org/t/p/w220_and_h330_face/6d5XOczc226jECq0LIX0siKtgHR.jpg", summary: "Llewelyn Moss stumbles upon dead bodies, $2 million and a hoard of heroin in a Texas desert, but methodical killer Anton Chigurh comes looking for it, with local sheriff Ed Tom Bell hot on his trail. The roles of prey and predator blur as the violent pursuit of money and justice collide.", rating: 8.0, actors: ["Javier Bardem", "Tommy Lee Jones", "Josh Brolin"]),
    Movie(title: "Parasite", year: 2019, posterURL: "https://media.themoviedb.org/t/p/w220_and_h330_face/7IiTTgloJzvGI1TAYymCfbfl3vT.jpg", summary: "All unemployed, Ki-taek's family takes peculiar interest in the wealthy and glamorous Parks for their livelihood until they get entangled in an unexpected incident.", rating: 8.5, actors: ["Song Kang-ho", "Lee Sun-kyun", "Cho Yeo-jeong"]),
    Movie(title: "Himmelfall", year: 2002, posterURL: "https://media.themoviedb.org/t/p/w220_and_h330_face/36ChA7rEeuqxPnUcdG9bFMYtVga.jpg", summary: "Reidar is a resident at Solihøgda psychiatric institution. He is expecting the Earth to be hit by a huge meteor any time now, but until then he is busy trying to keep his fellow patient, Juni, from killing herself.", rating: 5.5, actors: ["Kristoffer Joner", "Maria Bonnevie", "Kim Bodnia"]),
    Movie(title: "Chicken Run", year: 2000, posterURL: "https://media.themoviedb.org/t/p/w220_and_h330_face/8XgmIsbpVamdhwcNVsYzohFZTtT.jpg", summary: "The creators of Wallace & Gromit bring you an exciting and original story about a group of chickens determined to fly the coop–even if they can’t fly! It’s hardly poultry in motion when Rocky attempts to teach Ginger and her feathered friends to fly…but, with teamwork, determination and a little bit o’ cluck, the fearless flock plots one last attempt in a spectacular bid for freedom.", rating: 6.9, actors: ["Julia Sawhala", "Mel Gibson", "Imelda Staunton"]),
    Movie(title: "Dances with Wolves", year: 1990, posterURL: "https://media.themoviedb.org/t/p/w220_and_h330_face/hw0ZEHAaTqTxSXGVwUFX7uvanSA.jpg", summary: "Wounded Civil War soldier John Dunbar tries to commit suicide—and becomes a hero instead. As a reward, he's assigned to his dream post, a remote junction on the Western frontier, and soon makes unlikely friends with the local Sioux tribe.", rating: 7.8, actors: ["Kevin Costner", "Mary McDonnell", "Graham Greene"])
]
