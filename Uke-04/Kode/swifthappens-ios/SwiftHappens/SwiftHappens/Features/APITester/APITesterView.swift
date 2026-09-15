//
//  APITesterView.swift
//  SwiftHappens
//
//  Created by Ivan Lé Hjelmeland on 07/09/2026.
//

import SwiftUI

struct APITesterView: View {
    
    @State private var viewModel = APITesterViewModel()
    
    var body: some View {
        
        Form {
            Section("Request") {
                TextField("Skriv inn din URL", text: $viewModel.urlText)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled(true)
                    .keyboardType(.URL)
                
                Button {
                    // Her kjøres kode når knappen trykkes på
                    Task {
                        await viewModel.fetchData()
                    }
                } label: {
                    // Her er innholdet i knappen
                    if viewModel.isLoading {
                        HStack {
                            ProgressView()
                            Text("Henter data...")
                        }
                    } else {
                        Text("Send Request")
                    }
                }
                .disabled(viewModel.isLoading)
            }
            
            Section("Response") {
                TextEditor(text: $viewModel.responseText)
                    .font(.system(.footnote, design: .monospaced))
                    .frame(height: 500)
            }
        }
        .navigationTitle("API Tester")
        
    }
}

#Preview {
    NavigationStack {
        APITesterView()
    }
}
