import SwiftUI

struct Home: View {
    @State private var showAccount = false

    @ObservedObject var day: DayState

    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {

            // HEADER
            HStack {
                Text("dailyQ")
                    .font(.system(size: 15))
                    .foregroundColor(Color("TextPrimary"))

                Spacer()

                Text("Perfil")
                    .font(.system(size: 13))
                    .foregroundColor(Color("TextSecondary").opacity(0.6))
            }

            // SPACING LG
            Spacer().frame(height: 32)

            // SLOT RACHA (siempre ocupa espacio)
            DQSubtitle(text: "7 días pensando con calma")
                .opacity(0) // luego lógica real

            // SPACING LG
            Spacer().frame(height: 32)

            // CATEGORÍA
            DQSubtitle(text: "Reflexión")
                .foregroundColor(Color("TextTertiary").opacity(0.6))

            // ───────────────
            // CONTENEDOR PREGUNTA (H = 304)
            // ───────────────

            Spacer().frame(height: 32) // lg
            Spacer().frame(height: 32) // lg
            Spacer().frame(height: 48) // xl

            Text("¿Qué idea te acompañó hoy?")
                .font(.system(size: 26, weight: .semibold))
                .foregroundColor(Color("TextPrimary"))
                .multilineTextAlignment(.leading)

            Spacer().frame(height: 16) // ms

            // FLEX
            Spacer()

            // ───────────────
            // BLOQUE CTA
            // ───────────────

            DQMicroText(text: "No hay respuestas correctas.")

            Spacer().frame(height: 48)

            Button {
                day.status = .answering
            } label: {
                Text("Reflexionar")
                    .font(.system(size: 15))
                    .foregroundColor(Color("BackgroundPrimary"))
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color("Accent"))
                    .cornerRadius(12)
            }
        }
        .padding(32)
        .background(Color("BackgroundPrimary"))
    }


}
