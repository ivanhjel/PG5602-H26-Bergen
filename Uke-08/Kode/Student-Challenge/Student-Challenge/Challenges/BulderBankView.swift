//
//  BulderBankView.swift
//  Student-Challenge
//
//  Created by Ivan Lé Hjelmeland on 06/10/2026.
//

import SwiftUI

struct BulderPayment: Identifiable {
    let id = UUID()

    let recipient: String
    let amount: Double
}

struct BulderBankView: View {

    @State private var showSheet = false
    
    let payments = [
        BulderPayment(recipient: "Silje", amount: 200),
        BulderPayment(recipient: "Silje", amount: 150),
        BulderPayment(recipient: "Andreas", amount: 400),
        BulderPayment(recipient: "Silje", amount: 220),
        BulderPayment(recipient: "Silje", amount: 300),
        BulderPayment(recipient: "Marius", amount: 150),
        BulderPayment(recipient: "Silje", amount: 250),
        BulderPayment(recipient: "Silje", amount: 200)
    ]

    var body: some View {
        VStack(spacing: 24) {
            Image(systemName: "person.crop.circle")
                .font(.system(size: 60))

            Text("Betalingshistorikk")
                .font(.title)

            Button("Oppsummer Silje") {
                showSheet = true
            }
            .buttonStyle(.borderedProminent)
            
            Spacer()
        }
        .padding()
        .sheet(isPresented: $showSheet) {
            Text(summarizePayments())
                .multilineTextAlignment(.center)
                .presentationDetents([
                    .medium
                ])
                .presentationDragIndicator(.visible)
        }

    }

    func summarizePayments() -> String {
        let siljePayments = payments.filter {
            $0.recipient == "Silje"
        }

        let total = siljePayments.reduce(0) {
            $0 + $1.amount
        }
        
        let result = """
        Silje hadde \(siljePayments.count) transaksjoner \
        med total sum på \(total) kr
        """
        
        print(result)

        return result
    }
}

#Preview {
    BulderBankView()
}
