import SwiftUI

struct MemoryCardView: View {

    let memory: MemoryItem

    var body: some View {
        DQCard {

            // Fecha
            DQMicroText(
                text: memory.date.formatted(date: .long, time: .omitted)
            )

            // Pregunta
            DQTitle(text: memory.question)

            // Nota (si existe)
            if let note = memory.note, !note.isEmpty {
                DQSubtitle(text: note)
            }
        }
    }
}


