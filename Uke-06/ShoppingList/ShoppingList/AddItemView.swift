//
//  AddItemView.swift
//  ShoppingList
//
//  Created by Ivan Lé Hjelmeland on 28/09/2026.
//

import SwiftUI
import SwiftData

struct AddItemView: View {
    
    // Enironment er et sett med delte verdier som views kan lese.
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    @State private var name = ""
    @State private var quanity = 1
    @State private var category: ShoppingCategory = .groceries
    
    var body: some View {
        NavigationStack {
            Form {
                
                Section("Vare") {
                    TextField("Hva trenger du?", text: $name)
                }
                
                Section("Detaljer") {
                    Picker("Kategori", selection: $category) {
                        ForEach(ShoppingCategory.allCases, id: \.self) { category in
                            Text(category.rawValue)
                                .tag(category)
                        }
                    }
                    
                    Stepper(
                        "Antall: \(quanity)",
                        value: $quanity,
                        in: 1...20
                    )
                }
            }
            .navigationTitle("Legg til")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Avbryt") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Lagre") {
                        addItem()
                    }
                    .disabled(name.isEmpty)
                }
            }
        }
    }
    
    private func addItem() {
        let newItem = ShoppingItem(name: name, quantity: quanity, category: category)
        
        modelContext.insert(newItem)
        
        // Fix for new bug in Xcode 27
        do {
            try modelContext.save()
        } catch {
            print(error.localizedDescription)
        }
        
        dismiss()
    }
}

#Preview {
    AddItemView()
}
