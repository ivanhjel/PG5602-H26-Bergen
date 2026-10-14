//
//  EggTimer.swift
//  EggTimer
//
//  Created by Ivan Lé Hjelmeland on 13/10/2026.
//

import Foundation

enum EggType: String, CaseIterable {
    case runny = "Rennende"
    case soft = "Bløtkokt"
    case hard = "Hardkokt"
    
    var imageName: String {
        switch self {
        case .soft:
            return "soft"
        case .runny:
            return "runny"
        case .hard:
            return "hard"
        }
    }
    
    var cookingTime: String {
        switch self {
        case .soft:
            return "06:00"
        case .runny:
            return "03:00"
        case .hard:
            return "09:00"
        }
    }
}
