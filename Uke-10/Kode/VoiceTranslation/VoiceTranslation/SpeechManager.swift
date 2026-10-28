import Foundation
import Speech
import AVFoundation

@MainActor // UI-tilstand endres på hovedtråden
@Observable // SwiftUI oppdateres når properties endres
class SpeechManager {
    var text = ""            // Løpende tale-til-tekst
    var completedText = ""   // Ferdig tekst for oversettelse
    var isRecording = false
    var isProcessing = false

    // Vi skal gjenkjenne norsk tale.
    private let recognizer = SFSpeechRecognizer(
        locale: Locale(identifier: "nb-NO")
    )
    private let engine = AVAudioEngine() // Leser mikrofonen
    private var request: SFSpeechAudioBufferRecognitionRequest?
    private var task: SFSpeechRecognitionTask?
    private var hasTap = false

    func start() {
        guard !isRecording && !isProcessing else { return }
        isProcessing = true

        Task {
            // iOS må få lov til å bruke mikrofonen.
            let microphone = await AVAudioApplication
                .requestRecordPermission()

            // Gjør en callback om til async/await.
            let allowed = await withCheckedContinuation {
                (continuation: CheckedContinuation<Bool, Never>) in
                SFSpeechRecognizer.requestAuthorization { status in
                    continuation.resume(returning: status == .authorized)
                }
            }

            guard microphone && allowed,
                  recognizer?.isAvailable == true else {
                isProcessing = false
                return
            }

            do {
                // Appen skal ta opp lyd, ikke spille den av.
                let session = AVAudioSession.sharedInstance()
                try session.setCategory(.record, mode: .measurement)
                try session.setActive(true)

                let request = SFSpeechAudioBufferRecognitionRequest()
                request.shouldReportPartialResults = true
                self.request = request

                // En 'tap' leverer lydbiter fra mikrofonen.
                let input = engine.inputNode
                input.installTap(
                    onBus: 0,
                    bufferSize: 1024,
                    format: input.outputFormat(forBus: 0)
                ) { buffer, _ in
                    request.append(buffer)
                }
                hasTap = true

                engine.prepare()
                try engine.start()

                // Slett gammel tekst først når nytt opptak starter.
                text = ""
                completedText = ""
                isRecording = true
                isProcessing = false

                task = recognizer?.recognitionTask(with: request) {
                    result, error in
                    Task { @MainActor in
                        if let result {
                            // Beste forslag mens brukeren snakker.
                            self.text = result.bestTranscription
                                .formattedString
                            if result.isFinal {
                                self.finish()
                            }
                        }
                        if error != nil {
                            self.finish()
                        }
                    }
                }
            } catch {
                finish()
            }
        }
    }

    func stop() {
        guard isRecording else { return }
        engine.stop()
        removeTap()
        isRecording = false
        isProcessing = true
        // Speech får fullføre etter siste lydbit.
        request?.endAudio()
    }

    private func removeTap() {
        if hasTap {
            engine.inputNode.removeTap(onBus: 0)
            hasTap = false
        }
    }

    private func finish() {
        if engine.isRunning { engine.stop() }
        removeTap()
        task?.cancel()
        task = nil
        request = nil
        isRecording = false
        isProcessing = false
        // onChange(completedText) starter oversettelsen.
        if !text.isEmpty { completedText = text }
        try? AVAudioSession.sharedInstance().setActive(false)
    }
}