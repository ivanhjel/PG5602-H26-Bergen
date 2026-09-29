import SwiftUI
import SwiftData

@main struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: ShoppingItem.self) // Hvilke typer data finnes i prosjektet vårt
    }
}
