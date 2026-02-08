import SwiftUI

struct Home: View {
    @State private var showAccount = false

    @ObservedObject var day: DayState

    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {

            // HEADER
            HStack {
                Text("dailyQ")
                    .font(.system(size: 15, weight: .regular))
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
                .opacity(0) // luego lo activamos con lógica

            // SPACING LG
            Spacer().frame(height: 32)

            // CATEGORÍA
            DQSubtitle(text: "Reflexión")

                .foregroundColor(Color("TextTertiary").opacity(0.6))

            // SPACING LG
            Spacer().frame(height: 32)

            // PREGUNTA
            Text("¿Qué idea te acompañó hoy?")

                .font(.system(size: 26, weight: .semibold))
                .foregroundColor(Color("TextPrimary"))
                .multilineTextAlignment(.leading)

            // DOBLE SPACING LG
            Spacer().frame(height: 64)

            // TEXTO EDITORIAL
            DQMicroText(text: "No hay respuestas correctas.")

            Spacer()

            // SPACING 2XL
            Spacer().frame(height: 48)

            // CTA
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
