//
//  WeatherAPI.swift
//  RegnerDetIBergen
//
//  Created by Ivan Lé Hjelmeland on 05/10/2026.
//

import Foundation

struct WeatherAPI {
    
    func fetchWeather() async throws -> Weather {
        
        // hardkodet til Bergen sentrum
        let latitude = 60.3894
        let longitude = 5.3300
        
        let metUrl = "https://api.met.no/weatherapi/nowcast/2.0/complete?lat=\(latitude)&lon=\(longitude)"
        
        guard let url = URL(string: metUrl) else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: url)
        
        request.setValue("Studentprosjekt_ivahjel_kristiana", forHTTPHeaderField: "User-Agent")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse,
              200...299 ~= httpResponse.statusCode else {
            throw URLError(.badServerResponse)
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let nowcast = try decoder.decode(NowcastResponse.self, from: data)
        
        guard let current = nowcast.properties.timeseries.first else {
            throw URLError(.cannotParseResponse)
        }
        
        let details = current.data.instant.details
        
        guard let temprature = details.airTemperature,
              let precipitationRate = details.precipitationRate,
              let relativeHumidity = details.relativeHumidity,
              let windSpeed = details.windSpeed else {
            throw URLError(.cannotParseResponse)
        }
        
        return Weather(
            temperature: temprature,
            precipitationRate: precipitationRate,
            relativeHumidity: relativeHumidity,
            windSpeed: windSpeed,
            symbolCode: current.data.next1Hours?.summary.symbolCode ?? ""
        )
    }
}
