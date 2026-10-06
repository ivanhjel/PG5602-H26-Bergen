//
//  WeatherModels.swift
//  RegnerDetIBergen
//
//  Created by Ivan Lé Hjelmeland on 05/10/2026.
//

import Foundation

struct Weather {
    
    let temperature: Double
    let precipitationRate: Double
    let relativeHumidity: Double
    let windSpeed: Double
    let symbolCode: String
    
    var isRaining: Bool {
        precipitationRate >= 0.1
    }
    
    var rainDescription: String {
        switch precipitationRate {
        case 0..<0.1:
            return "Ingen nedbør"
        case 0.1..<0.5:
            return "Litt nedbør"
        case 0.5..<2:
            return "Regn"
        case 2..<5:
            return "Mye regn"
        default:
            return "Skikkelig Bergensvær"
        }
    }
    
    var sfSymbol: String {
        
        let code = symbolCode.lowercased()
        
        if code.contains("thunder") {
            return "cloud.bolt.rain.fill"
        }
        
        if code.contains("heavyrain") {
            return "cloud.heavyrain.fill"
        }
        
        if code.contains("rain") {
            return "cloud.rain.fill"
        }
        
        if code.contains("sleet") {
            return "cloud.sleet.fill"
        }
        
        if code.contains("snow") {
            return "cloud.snow.fill"
        }
        
        if code.contains("fog") {
            return "cloud.fog.fill"
        }
        
        if code.contains("clearsky") {
            return "sun.max.fill"
        }
        
        if code.contains("fair") || code.contains("partlycloudy") {
            return "cloud.sun.fill"
        }
        
        return "cloud.fill"
        
    }
}

struct NowcastResponse: Decodable {
    let properties: WeatherProperties
}

struct WeatherProperties: Decodable {
    let timeseries: [TimeSeries]
}

struct TimeSeries: Decodable {
    let data: TimeSeriesData
}

struct TimeSeriesData: Decodable {
    let instant: Instant
    let next1Hours: NextHours?
}

struct Instant: Decodable {
    let details: InstantDetails
}

struct InstantDetails: Decodable {
    let airTemperature: Double?
    let precipitationRate: Double?
    let relativeHumidity: Double?
    let windSpeed: Double?
}

struct NextHours: Decodable {
    let summary: WeatherSummary
}

struct WeatherSummary: Decodable {
    let symbolCode: String
}
