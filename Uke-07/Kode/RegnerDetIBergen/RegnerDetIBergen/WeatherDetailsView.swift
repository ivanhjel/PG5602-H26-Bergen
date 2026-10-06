//
//  WeatherDetailsView.swift
//  RegnerDetIBergen
//
//  Created by Ivan Lé Hjelmeland on 05/10/2026.
//

import SwiftUI

struct WeatherDetailsView: View {
    
    let weather: Weather
    
    var body: some View {
        
        VStack(spacing: 28) {
            
            VStack(spacing: 8) {
                
                Image(systemName: weather.sfSymbol)
                    .font(.system(size: 42))
                    .symbolRenderingMode(.multicolor)
                
                Text("Været akkurat nå")
                    .font(.title2)
                    .bold()
                
                Text("Bergen")
                    .foregroundStyle(.secondary)
                
            }
            
            VStack(spacing: 18) {
                
                WeatherRow(symbol: "thermometer.medium", title: "Temperatur", value: "\(weather.temperature, default: "%.0f") °C")
                
                Divider()
                
                WeatherRow(symbol: "drop.fill", title: "Nedbør", value: "\(weather.precipitationRate, default: "%.0f") mm/t")
                
                Divider()
                
                WeatherRow(symbol: "wind", title: "Vind", value: "\(weather.windSpeed, default: "%.1f") m/s")
                
                Divider()
                
                WeatherRow(symbol: "humidity.fill", title: "Luftfuktighet", value: "\(weather.relativeHumidity, default: "%.0f") %")
            }
            
            Spacer()
            
            Text("Data fra MET Norway")
                .font(.caption)
                .foregroundStyle(.secondary)
            
        }
        .padding(24)
        
    }
}

struct WeatherRow: View {
    
    let symbol: String
    let title: String
    let value: String
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: symbol)
                .font(.title3)
                .frame(width: 28)
                .foregroundStyle(.blue)
            
            Text(title)
            
            Spacer()
            
            Text(value)
                .bold()
        }
    }
}

/*#Preview {
    WeatherDetailsView()
}*/
