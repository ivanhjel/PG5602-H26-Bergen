//
//  Bookmark.swift
//  Bookmarks
//
//  Created by Ivan Lé Hjelmeland on 20/10/2026.
//

import Foundation
import SwiftData

@Model
class Bookmark {
    
    var title: String
    var url: String
    var source: String
    var createdAt: Date
    
    init(title: String, url: String, source: String, createdAt: Date = .now) {
        self.title = title
        self.url = url
        self.source = source
        self.createdAt = createdAt
    }
}
