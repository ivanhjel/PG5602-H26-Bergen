//
//  ShoppingCategory.swift
//  ShoppingList
//
//  Created by Ivan Lé Hjelmeland on 28/09/2026.
//

import Foundation

enum ShoppingCategory: String, CaseIterable, Codable {
    case groceries = "Dagligvarer"
    case beauty = "Skjønnhet og velvære"
    case home = "Hjem og bolig"
    case health = "Apotek og helse"
    case clothes = "Klær"
    case other = "Annet"
}
