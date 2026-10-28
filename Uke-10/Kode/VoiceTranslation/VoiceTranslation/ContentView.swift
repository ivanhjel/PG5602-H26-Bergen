import SwiftUI
import Translation
import AVFoundation

struct ContentView: View {
    
    @State private var language = "en"
    @State private var translatedText = ""
    
    @State private var speaker = AVSpeechSynthesizer()
    @State private var configuration: TranslationSession.Configuration?
    @State private var speech = SpeechManager()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
            
                Text("🇳🇴 Norsk")
                    .font(.title)
                    .fontWeight(.bold)
                
                Image(systemName: "arrow.down")
                
                Picker("Oversett til", selection: $language) {
                    Text("🇬🇧 Engelsk").tag("en")
                    Text("🇸🇪 Svensk").tag("sv")
                    Text("🇫🇷 Fransk").tag("fr")
                    Text("🇩🇪 Tysk").tag("de")
                    Text("🇪🇸 Spansk").tag("es")
                    Text("🇯🇵 Japansk").tag("ja")
                }
                .pickerStyle(.menu)
                
                VStack(alignment: .leading, spacing: 12) {
                    
                    Text("DU SA")
                        .font(.caption.bold())
                        .foregroundStyle(.secondary)
                    
                    Text(speech.text.isEmpty ? "Hva skal du oversette?" : speech.text)
                        .font(.title3)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                }
                .padding(20)
                .background(.quaternary)
                .cornerRadius(12)
                
                VStack(alignment: .leading, spacing: 12) {
                    
                    HStack {
                        
                        Text("OVERSETTELSE")
                            .font(.caption.bold())
                            .foregroundStyle(.secondary)
                        
                        Spacer()
                        
                        Button {
                            speak()
                        } label: {
                            Image(systemName: "play.circle.fill")
                                .font(.title)
                        }
                        .disabled(translatedText.isEmpty)

                    }
                    
                    Text(translatedText)
                        .font(.title3)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                }
                .padding(20)
                .background(.blue.opacity(0.1))
                .cornerRadius(12)
                
                Spacer()
                
                Button {
                    if speech.isRecording {
                        speech.stop()
                    } else {
                        speaker.stopSpeaking(at: .immediate)
                        speech.start()
                    }
                } label: {
                    Image(systemName: speech.isRecording ? "stop.fill" : "mic.fill")
                        .frame(width: 85, height: 85)
                        .background(speech.isRecording ? .red : .blue, in: .circle)
                        .foregroundStyle(.white)
                        .font(.system(size: 32))
                        
                }
                .disabled(speech.isProcessing)
                
                Text(speech.isRecording ? "Trykk for å stoppe" : "Trykk for å snakke")
                    .font(.subheadline.monospaced())

            }
            .padding()
            .onChange(of: speech.completedText) { oldValue, newValue in
                translate()
            }
            .onChange(of: language) { oldValue, newValue in
                translate()
            }
            .translationTask(configuration) { session in
                let source = speech.completedText
                
                do {
                    let result = try await session.translate(source)
                    if source == speech.completedText {
                        translatedText = result.targetText
                    }
                } catch {
                    translatedText = "Kunne ikke oversette"
                }
            }
        }
    }
    
    func speak() {
        guard !translatedText.isEmpty else {
            return
        }
        
        speaker.stopSpeaking(at: .immediate)
        
        let voices = ["en": "en-GB",
                      "sv": "sv-SE",
                      "fr": "fr-FR",
                      "de": "de-DE",
                      "es": "es-ES",
                      "ja": "ja-JP"
        ]
        
        try? AVAudioSession.sharedInstance().setCategory(.playback)
        try? AVAudioSession.sharedInstance().setActive(true)
        
        let utterance = AVSpeechUtterance(string: translatedText)
        utterance.voice = AVSpeechSynthesisVoice(
            language: voices[language] ?? "en-GB"
        )
        utterance.rate = 0.5
        utterance.volume = 1.0
        speaker.speak(utterance)
    }
    
    func translate() {
        guard !speech.completedText.isEmpty else {
            return
        }
        
        translatedText = ""
        
        let target = Locale.Language(identifier: language)
        
        if configuration?.target == target {
            configuration?.invalidate()
        } else {
            configuration = .init(source: .init(identifier: "nb"), target: target)
        }
    }
}

#Preview {
    ContentView()
}
