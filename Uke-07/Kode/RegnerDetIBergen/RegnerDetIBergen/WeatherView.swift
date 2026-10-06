//
//  WeatherView.swift
//  RegnerDetIBergen
//
//  Created by Ivan Lé Hjelmeland on 05/10/2026.
//

import SwiftUI

struct WeatherView: View {
    
    @State private var viewModel = WeatherViewModel()
    
    @State private var showDetails = false
    @State private var showUmbrellaAlert = false
    
    var body: some View {
        
        Group {
            
            if viewModel.isLoading && viewModel.weather == nil {
                // hvis viewmodel forsøker å hente data OG værdata ikke eksisterer
                ProgressView("Henter værdata..")
            } else if let weather = viewModel.weather {
                // hvis værdata eksisterer (og vi ikke laster)
                weatherContent(weather: weather)
            } else {
                // hvis vi ikke har data og ikke laster
                ContentUnavailableView("Ingen værdata", systemImage: "icloud.slash.fill", description: Text(viewModel.errorMessage ?? "Noe gikk galt."))
            }
        }
        .onAppear {
            Task {
                await viewModel.loadWeather()
            }
        }
    }
    
    private func weatherContent(weather: Weather) -> some View {
        VStack(spacing: 20) {
            
            Spacer()
            
            Text("Regner det i Bergen?")
                .font(.title)
                .bold()
            
            Text("Akkurat nå")
                .foregroundStyle(.secondary)
            
            Spacer()
            
            Image(systemName: weather.sfSymbol)
                .font(.system(size: 110))
                .symbolRenderingMode(.multicolor)
                .symbolEffect(.breathe, options: .repeating)
            
            Text(weather.isRaining ? "JA." : "NEI.")
                .font(
                    .system(
                        size: 68,
                        weight: .black,
                        design: .rounded
                    )
                )
            
            Text(weather.rainDescription)
                .font(.headline)
                .foregroundStyle(.secondary)
            
            HStack {
                Label("\(weather.temperature, specifier: "%.0f")", systemImage: "thermometer.medium")
                
                Text("•")
                
                Label("\(weather.precipitationRate, specifier: "%.0f")", systemImage: "drop.fill")
            }
            .font(.headline)
            .foregroundStyle(.secondary)
            
            Button {
                // Action, kjøres ved trykk
                showDetails = true
            } label: {
                // Designet for selve knappen
                Label("Se mer vær", systemImage: "cloud.fill")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            
            Button {
                showUmbrellaAlert = true
            } label: {
                Label("Trenger jeg paraply?", systemImage: "umbrella.fill")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.bordered)
            .controlSize(.large)
            
            Button {
                Task {
                    await viewModel.loadWeather()
                }
            } label: {
                Label("Oppdater", systemImage: "arrow.trianglehead.clockwise.rotate.90")
                    .font(.headline)
            }
            .foregroundStyle(.secondary)
            
            Spacer()
            
        }
        .padding(24)
        .background(.blue.opacity(0.1))
        .sheet(isPresented: $showDetails) {
            WeatherDetailsView(weather: weather)
                .presentationDetents([
                    .height(430), // Custom høyde på sheetet
                    .medium // Apple sin høyde på halvfull skjerm
                ])
                .presentationDragIndicator(.automatic)
                
        }
        .alert("Paraply?", isPresented: $showUmbrellaAlert) {
            Button("Ok") { }
        } message: {
            if weather.isRaining {
                Text("Ja. Det regner i Bergen. Ta med paraply.")
            } else {
                Text("Nei. Det regner ikke akkurat nå, men husk at vi er i Bergen.")
            }
        }
    }
}

#Preview {
    WeatherView()
}
