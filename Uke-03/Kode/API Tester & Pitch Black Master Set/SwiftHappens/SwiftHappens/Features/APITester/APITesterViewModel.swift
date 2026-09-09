//
//  APITesterViewModel.swift
//  SwiftHappens
//
//  Created by Ivan Lé Hjelmeland on 07/09/2026.
//

import Foundation
import Observation

@Observable
class APITesterViewModel {
    
    var urlText = ""
    var responseText = ""
    var isLoading = false
    
    private let api = API()
    
    func fetchData() async {
        
        isLoading = true
        
        print("👩🏻‍💻 fetchData started...")
        
        do {
            let text = try await api.fetchData(from: urlText)
            
            let max = 100_000
            
            if text.count > max {
                responseText = String(text.prefix(max))
            } else {
                responseText = text
            }
        } catch {
            print("📛 Noe gikk galt: ", error)
            responseText = "Noe gikk galt: \(error.localizedDescription)"
        }
        
        isLoading = false
    }
    
}
