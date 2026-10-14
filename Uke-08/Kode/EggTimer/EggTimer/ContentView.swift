import SwiftUI


struct ContentView: View {
    var body: some View {
        NavigationStack {
            EggTimerView()
                .navigationTitle("EggTimer")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
