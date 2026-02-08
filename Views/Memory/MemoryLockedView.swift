import SwiftUI

struct MemoryLockedView: View {

    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(alignment: .leading, spacing: 32) {

            Spacer()

            Text("Hay ideas que merecen guardarse.")
                .font(.system(size: 15))
                .foregroundColor(Color("TextPrimary"))

            Text("Guarda reflexiones y vuelve a ellas cuando quieras.")
                .font(.system(size: 13))
                .foregroundColor(
                    Color("TextSecondary").opacity(0.6)
                )

            // Card fantasma (misma que Free)
            MemoryCardView(
                memory: MemoryItem(
                    date: Date(),
                    question: "¿Por qué la gente inteligente también cree tonterías?",
                    note: "A veces la inteligencia no convive con el sentido común."
                )
            )
            .opacity(0.5)

            Spacer()

            Text("Desbloquear memoria.")
                .font(.system(size: 15))
                .foregroundColor(Color("TextTertiary"))

            Button("Volver") {
                dismiss()
            }
            .font(.system(size: 13))
            .foregroundColor(
                Color("TextSecondary").opacity(0.6)
            )
        }
        .padding(32)
        .background(Color("BackgroundPrimary"))
    }
}

