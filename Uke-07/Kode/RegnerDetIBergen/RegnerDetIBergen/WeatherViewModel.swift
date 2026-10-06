//
//  WeatherViewModel.swift
//  RegnerDetIBergen
//
//  Created by Ivan Lé Hjelmeland on 05/10/2026.
//

import Foundation
import Observation

@Observable
class WeatherViewModel {
    
    var weather: Weather?
    var isLoading = false
    var errorMessage: String?
    
    private let api = WeatherAPI()
    
    func loadWeather() async {
        
        isLoading = true
        errorMessage = nil
        
        do {
            weather = try await api.fetchWeather()
        } catch {
            errorMessage = "Kunne ikke hente værdata"
            print(error.localizedDescription)
        }
        
        isLoading = false
    }
}
