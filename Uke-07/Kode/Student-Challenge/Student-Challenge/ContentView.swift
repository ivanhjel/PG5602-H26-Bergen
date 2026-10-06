import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                Section("Utfordringer") {
                    NavigationLink("Vipps") {
                        VippsView()
                    }

                    NavigationLink("Posten") {
                        PostenView()
                    }
                    
                    NavigationLink("Trumf") {
                        TrumfView()
                    }
                    
                    NavigationLink("NRK Radio") {
                        NRKRadioView()
                    }
                    
                    NavigationLink("Finn") {
                        FinnView()
                    }
                    
                    NavigationLink("TV2 Play") {
                        TV2PlayView()
                    }
                    
                    /*NavigationLink("Norsk Tipping") {
                        NorskTippingView()
                    }
                    
                    NavigationLink("Bulder Bank") {
                        BulderBankView()
                    }*/
                }
            }
            .navigationTitle("Can we make it?")
        }
    }
}

#Preview {
    ContentView()
}
