//
//  API.swift
//  SwiftHappens
//
//  Created by Ivan Lé Hjelmeland on 07/09/2026.
//

import Foundation

struct API {
    
    func fetchData(from urlString: String) async throws -> String {
        
        // Dette betingelsen må være sann for at vi skal kunne fortsette
        guard let url = URL(string: urlString) else {
            // Hvis ikke, avslutt med en feil
            throw URLError(.badURL)
        }
        
        print("👩🏻‍💻 Sender request til: ", url)
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        print("👩🏻‍💻 Antall bytes:", data.count)
        
        return String(decoding: data, as: UTF8.self)
    }
}
