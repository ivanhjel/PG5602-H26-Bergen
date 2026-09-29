//
//  ShoppingItem.swift
//  ShoppingList
//
//  Created by Ivan Lé Hjelmeland on 28/09/2026.
//

import Foundation
import SwiftData

@Model
final class ShoppingItem {
    var name: String
    var quantity: Int
    var category: ShoppingCategory
    var isBought: Bool
    var createdAt: Date
    
    init(name: String, quantity: Int = 1, category: ShoppingCategory) {
        self.name = name
        self.quantity = quantity
        self.category = category
        self.isBought = false
        self.createdAt = Date()
    }
}
