//
//  TicketsView.swift
//  SwiftHappens
//
//  Created by Ivan Lé Hjelmeland on 28/08/2026.
//

import SwiftUI

struct TicketsView: View {
    
    private let adultPrice = 44.0
    private let kidPrice = 22.0
    private let seniorPrice = 44.0
    
    @State private var adults: Int = 0
    @State private var kids: Int = 0
    @State private var seniors: Int = 0
    
    private func isEligibleForDiscount() -> Bool {
        return adults + seniors > 0 && kids > 0
    }
    
    private func calculatePrice() -> Double {
        let adultTotal = Double(adults) * adultPrice
        let kidsTotal = Double(kids) * kidPrice
        let seniorTotal = Double(seniors) * seniorPrice
        
        let sum = adultTotal + kidsTotal + seniorTotal
        
        if isEligibleForDiscount() {
            return sum * 0.6666
        }
        
        return sum
    }
    
    var body: some View {
        NavigationStack {
            
            ScrollView {
                
                VStack {
                    
                    // MARK: - Adults
                    HStack {
                        Button {
                            adults += 1
                        } label: {
                            HStack {
                                Text("\(adults)")
                                    .font(.system(size: 40))
                                    .fontWeight(.light)
                                    .foregroundStyle(.white)
                                    .frame(width: 40)
                                    .minimumScaleFactor(0.5)
                                    .lineLimit(1)
                                Image(systemName: "figure.stand")
                                    .foregroundStyle(.white)
                                    .font(.largeTitle)
                                    .padding(.horizontal)
                                VStack(alignment: .leading) {
                                    Text("VOKSEN")
                                        .font(.caption)
                                        .fontWeight(.bold)
                                        .foregroundStyle(.white)
                                    Text(adultPrice, format: .currency(code: "NOK"))
                                        .font(.title)
                                        .foregroundStyle(.white)
                                }
                            }
                            
                        }
                        
                        Spacer()
                        
                        Divider()
                            .background(.white.opacity(0.5))
                        
                        Button("—") {
                            if adults > 0 {
                                adults -= 1
                            }
                        }
                        .disabled(adults == 0)
                        .tint(.white.opacity(0.5))
                        .font(.largeTitle)
                        .padding()
                    }
                    .padding()
                    
                    Divider()
                        .background(.white.opacity(0.5))
                    
                    
                    // MARK: - Kids
                    HStack {
                        Button {
                            kids += 1
                        } label: {
                            HStack {
                                Text("\(kids)")
                                    .font(.system(size: 40))
                                    .fontWeight(.light)
                                    .foregroundStyle(.white)
                                    .frame(width: 40)
                                    .minimumScaleFactor(0.5)
                                    .lineLimit(1)
                                Image(systemName: "figure.child")
                                    .foregroundStyle(.white)
                                    .font(.largeTitle)
                                    .padding(.horizontal)
                                VStack(alignment: .leading) {
                                    Text("BARN")
                                        .font(.caption)
                                        .fontWeight(.bold)
                                        .foregroundStyle(.white)
                                    Text(kidPrice, format: .currency(code: "NOK"))
                                        .font(.title)
                                        .foregroundStyle(.white)
                                }
                            }
                            
                        }
                        
                        Spacer()
                        
                        Divider()
                            .background(.white.opacity(0.5))
                        
                        Button("—") {
                            if kids > 0 {
                                kids -= 1
                            }
                        }
                        .disabled(kids == 0)
                        .tint(.white.opacity(0.5))
                        .font(.largeTitle)
                        .padding()
                    }
                    .padding()
                    
                    Divider()
                        .background(.white.opacity(0.5))
                    
                    
                    // MARK: - Seniors
                    HStack {
                        Button {
                            seniors += 1
                        } label: {
                            HStack {
                                Text("\(seniors)")
                                    .font(.system(size: 40))
                                    .fontWeight(.light)
                                    .foregroundStyle(.white)
                                    .frame(width: 40)
                                    .minimumScaleFactor(0.5)
                                    .lineLimit(1)
                                Image(systemName: "figure.roll")
                                    .foregroundStyle(.white)
                                    .font(.largeTitle)
                                    .padding(.horizontal)
                                VStack(alignment: .leading) {
                                    Text("HONNØR")
                                        .font(.caption)
                                        .fontWeight(.bold)
                                        .foregroundStyle(.white)
                                    Text(seniorPrice, format: .currency(code: "NOK"))
                                        .font(.title)
                                        .foregroundStyle(.white)
                                }
                            }
                        }
                        
                        Spacer()
                        
                        Divider()
                            .background(.white.opacity(0.5))
                        
                        Button("—") {
                            if seniors > 0 {
                                seniors -= 1
                            }
                        }
                        .disabled(seniors == 0)
                        .tint(.white.opacity(0.5))
                        .font(.largeTitle)
                        .padding()
                    }
                    .padding()
                    
                    Divider()
                        .background(.white.opacity(0.5))
                }
                .background(.black.opacity(0.8))
            }
            
            VStack(spacing: 12) {
                Text("BETAL MED VIPPS")
                    .font(.footnote)
                HStack {
                    Text("Kjøp billett -")
                        .font(.title2)
                        .fontWeight(.semibold)
                    Text(calculatePrice(), format: .currency(code: "NOK"))
                    
                }
                
                if isEligibleForDiscount() {
                    Text("33,33% Familierabatt")
                } else {
                    Text("Ingen rabatt")
                }
                
            }
            .foregroundStyle(.white)
            .padding(40)
            .frame(maxWidth: .infinity)
            .background(Color(hex: 0xcd4629))
            .navigationTitle("Kjøp enkeltbillett")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    TicketsView()
}
