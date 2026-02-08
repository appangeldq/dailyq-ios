import SwiftUI

struct MemoryCardView: View {

    let memory: MemoryItem

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {

            // Fecha
            Text(memory.date.formatted(date: .long, time: .omitted))
                .font(.system(size: 12))
                .foregroundColor(Color("TextTertiary"))

            // Pregunta
            Text(memory.question)
                .font(.system(size: 15))
                .foregroundColor(Color("TextPrimary"))
                .lineLimit(2)

            // Nota (si existe)
            if let note = memory.note, !note.isEmpty {
                Text(note)
                    .font(.system(size: 13))
                    .foregroundColor(Color("TextSecondary").opacity(0.6))
                    .lineLimit(2)
            }
        }
        .padding(16)
        .background(Color("BackgroundPrimary"))
        .cornerRadius(12)
    }
}
