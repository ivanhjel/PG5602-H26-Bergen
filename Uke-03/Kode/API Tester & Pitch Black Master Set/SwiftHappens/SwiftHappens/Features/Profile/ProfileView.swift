//
//  ProfileView.swift
//  SwiftHappens
//
//  Created by Ivan Lé Hjelmeland on 25/08/2026.
//

import SwiftUI

struct ProfileView: View {
    
    // MARK: - Personlig informasjon
    
    let name: String = "Navn Navnesen"
    let jobTitle: String = "Student og kommende iOS-utvikler"
    
    let age: Int = 24
    let city: String = "Bergen"
    
    let email: String = "navn@kristiania.no"
    let phoneNumber: String = "+47 222 25 555"
    let linkedIn: String = "linkedin.com/in/navnnavnesen"
    
    let emailLink: URL = URL(string: "mailto:navn@kristiania.no")!
    let phoneLink: URL = URL(string: "tel:+4722225555")!
    let linkedInLink: URL = URL(string: "https://linkedin.com/in/navnnavnesen")!
    
    let summary: String = """
        Engasjert utviklerstudent som liker å kombinere teknologi, design og problemløsning. Jeg lnsker å lage apper som er enkle å forstå, men som også er behagelig å bruke.
        """
    
    let education: String = "Bachelor i informasjonsteknologi"
    let school: String = "Høyskolen Kristiania"
    let startYear: Int = 2024
    let graduationYear: Int = 2027
    
    var body: some View {
        
        ScrollView {
            
            VStack(spacing: 20) {
                
                // MARK: Profilkort
                
                VStack(spacing: 8) {
                    Image("ivan")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 96, height: 96)
                        .clipShape(Circle())
                    
                    Text(name)
                        .font(.title.bold())
                        .foregroundStyle(.primary)
                    
                    Text(jobTitle)
                        .font(.title3)
                        .foregroundStyle(.secondary)
                    
                    HStack {
                        Label(city, systemImage: "location.fill")
                        Label("\(age) år", systemImage: "person.fill")
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(.background)
                .cornerRadius(24)
                
                /*// MARK: - Fun
                
                HStack(spacing: 20) {
                    VStack(alignment: .leading) {
                        Text("Erfaring")
                            .font(.headline)
                        
                        Text("iOS-utvikler")
                        Text("2 ukers erfaring")
                            .foregroundStyle(.secondary)
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .padding()
                    .background(.background)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    
                    VStack(alignment: .leading) {
                        Text("Utdanning")
                            .font(.headline)
                        
                        Text("Bachelor i informasjonsteknologi")
                        Text("Kristiania")
                            .foregroundStyle(.secondary)
                        
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .padding()
                    .background(.background)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                }
                //.fixedSize(horizontal: false, vertical: true)*/
                
                // MARK: - Kontakt meg
                
                VStack(alignment: .leading, spacing: 16) {
                    Text("Kontakt meg")
                        .font(.title2.bold())
                    
                    Divider()
                    
                    Link(destination: emailLink) {
                        HStack {
                            Label(email, systemImage: "envelope.front")
                            
                            Spacer()
                            
                            Image(systemName: "arrow.up.right")
                        }
                    }
                    
                    Link(destination: phoneLink) {
                        HStack {
                            Label(phoneNumber, systemImage: "phone")
                            
                            Spacer()
                            
                            Image(systemName: "arrow.up.right")
                        }
                    }
                    
                    Link(destination: linkedInLink) {
                        HStack {
                            Label(linkedIn, systemImage: "link")
                            
                            Spacer()
                            
                            Image(systemName: "arrow.up.right")
                        }
                    }
                    
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(.background)
                .cornerRadius(24)
                
                // MARK: - Om meg
                
                VStack(alignment: .leading, spacing: 16) {
                    Text("Om meg")
                        .font(.title2.bold())
                    
                    Divider()
                    
                    Text(summary)
                        .foregroundStyle(.secondary)
                        .lineSpacing(4)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(.background)
                .cornerRadius(24)
                
                // MARK: - Utdanning
                
                VStack(alignment: .leading) {
                    Text("Utdanning")
                        .font(.title2.bold())
                    
                    Divider()
                    
                    HStack(spacing: 12) {
                        
                        Image(systemName: "graduationcap.fill")
                            .font(.title2)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(education)
                                .font(.headline)
                            Text(school)
                                .foregroundStyle(.secondary)
                            Text("\(startYear) - \(graduationYear)")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(.background)
                .cornerRadius(24)
            }
            .padding()
        }
        .background(Color(uiColor: .secondarySystemBackground))
        .navigationTitle("Profil")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ProfileView()
}
