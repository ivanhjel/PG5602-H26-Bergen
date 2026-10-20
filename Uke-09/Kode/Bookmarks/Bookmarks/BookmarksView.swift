//
//  BookmarksView.swift
//  Bookmarks
//
//  Created by Ivan Lé Hjelmeland on 20/10/2026.
//

import SwiftUI
import SwiftData

struct BookmarksView: View {
    @Environment(\.modelContext) private var modelContext
    
    @Query(sort: \Bookmark.createdAt, order: .reverse)
    private var bookmarks: [Bookmark]
    
    @State private var title = ""
    @State private var url = ""
    @State private var source = "Safari"
    
    var body: some View {
        List {
            
            Section("Nytt bokmerke") {
                TextField("Tittel", text: $title)
                TextField("URL", text: $url)
                TextField("Kilde", text: $source)
                
                Button("Lagre bokmerke") {
                    saveBookmark()
                }
                .disabled(title.isEmpty || url.isEmpty)
                
            }
            
            Section("Mine bokmerker") {
                ForEach(bookmarks) { bookmark in
                    VStack(alignment: .leading, spacing: 4) {
                        Text(bookmark.title)
                            .font(.headline)
                        Text(bookmark.url)
                            .font(.caption)
                        Text(bookmark.source)
                            .font(.caption)
                        Text(bookmark.createdAt, style: .date)
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                }
                .onDelete(perform: deleteBookmarks)
            }
            
        }
        .navigationTitle("Bokmerker")
    }
    
    func saveBookmark() {
        let bookmark = Bookmark(title: title, url: url, source: source)
        
        modelContext.insert(bookmark)
        title = ""
        url = ""
    }
    
    func deleteBookmarks(at offsets: IndexSet) {
        for index in offsets {
            modelContext.delete(bookmarks[index])
        }
    }
}

#Preview {
    NavigationStack {
        BookmarksView()
    }
}
