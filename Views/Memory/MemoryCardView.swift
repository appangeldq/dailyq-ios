import SwiftUI

struct MemoryCardView: View {

    let memory: MemoryItem

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {

            // Fecha
            Text(memory.date.formatted(date: .long, time: .omitted))
                .font(.system(size: 12))
                .foregroundColor(Color("TextTertiary"))

            // Texto principal (nota / reflexión)
            Text(memory.text)
                .font(.system(size: 15))
                .foregroundColor(Color("TextPrimary"))
                .lineLimit(3)
        }
        .padding(16)
        .background(Color("BackgroundPrimary"))
        .cornerRadius(12)
    }
}
