//
//  PetViewModel.swift
//  Tamagotchi
//
//  Created by Ivan Lé Hjelmeland on 19/10/2026.
//

import Foundation
import Observation

@Observable
class PetViewModel {
    
    var pet = Pet(name: "Poo", emoji: "💩", happiness: UserDefaults.standard.integer(forKey: "pet_happiness"), energy: UserDefaults.standard.integer(forKey: "pet_energy"))
    var reaction = ""
    
    func feed() {
        pet.energy += 20
        
        if pet.energy > 100 {
            pet.energy = 100
        }
        save()
    }
    
    func sleep() {
        pet.energy += 30
        
        if pet.happiness >= 20 {
            pet.happiness -= 20
        }
        
        if pet.energy > 100 {
            pet.energy = 100
        }
        
        save()
    }
    
    func play() {
        if pet.energy >= 10 {
            pet.energy -= 10
            pet.happiness += 20
            save()
        }
    }
    
    func status() -> String {
        if pet.happiness >= 70 {
            return "Jeg er så glad 😍"
        } else if pet.happiness >= 30 {
            return "Jeg har det bra 🙂"
        } else {
            return "Halloooooo???"
        }
    }
    
    func save() {
        UserDefaults.standard.set(pet.happiness, forKey: "pet_happiness")
        UserDefaults.standard.set(pet.energy, forKey: "pet_energy")
    }
}

