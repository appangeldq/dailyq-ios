import SwiftUI

struct MemoryCardView: View {

    let memory: MemoryItem

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {

            // Fecha
            Text(memory.date.formatted(date: .long, time: .omitted))
                .font(.system(size: 12))
                .foregroundColor(
                    Color("TextSecondary").opacity(0.4)
                )

            // Pregunta
            Text(memory.question)
                .font(.system(size: 15, weight: .semibold))
                .foregroundColor(
                    Color("TextPrimary")
                )
                .lineLimit(3)

            // Nota (si existe)
            if let note = memory.note, !note.isEmpty {
                Text(note)
                    .font(.system(size: 13, weight: .regular))
                    .foregroundColor(
                        Color("TextSecondary").opacity(0.6)
                    )
                    .lineLimit(2)
            }
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color("BackgroundSecondary"))
        .cornerRadius(12)
    }
}

