import SwiftUI

struct Reflection: View {

    @ObservedObject var day: DayState
    let question: DailyQuestion

    @State private var text: String = ""

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {

                // Header
                HStack {
                    Button {
                        day.status = .notStarted
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundColor(Color("TextSecondary"))
                            .padding(10)
                    }
                    Spacer()
                }
                .frame(height: 32)
                .padding(.bottom, 8)

                // Card de reflexión (protagonista)
                VStack(alignment: .leading, spacing: 24) {

                    Text("Reflexión")
                        .font(.system(size: 13))
                        .foregroundColor(Color("TextTertiary"))

                    ScrollView {
                        Text(
                            question.reflectionText
                                .replacingOccurrences(of: "\\n", with: "\n")
                        )
                        .font(.system(size: 15))
                        .foregroundColor(Color("TextPrimary"))
                        .multilineTextAlignment(.leading)
                    }
                    .frame(minHeight: 180, maxHeight: 360)


                }
                .padding(.horizontal, 32)
                .padding(.vertical, 48)
                .background(Color("BackgroundSecondary"))
                .cornerRadius(12)

                // Separación clara lectura → acción
                Spacer(minLength: 24)

                // Bloque inferior compacto
                VStack(spacing: 16) {

                    // Card escribir
                    ZStack(alignment: .topLeading) {

                        if text.isEmpty {
                            Text("Escribe algo…")
                                .font(.system(size: 15))
                                .foregroundColor(Color("TextSecondary"))
                                .padding(.top, 16)
                                .padding(.leading, 16)
                                .allowsHitTesting(false)
                        }

                        TextEditor(text: $text)
                            .font(.system(size: 15))
                            .padding(12)
                            .scrollContentBackground(.hidden) // 👈 ESTA ES LA CLAVE
                            .background(Color.clear)

                    }
                    .frame(height: 100)
                    .background(Color("BackgroundPrimary"))
                    .cornerRadius(12)
                    .shadow(
                        color: Color.black.opacity(0.06),
                        radius: 4,
                        x: 0,
                        y: 2
                    )

                    // CTA Guardar (AHORA SIEMPRE ALCANZABLE)
                    Button {
                        day.saveReflection(text)
                        day.status = .completed
                    } label: {
                        Text("Guardar")
                            .font(.system(size: 15))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, minHeight: 48)
                            .background(Color("Accent"))
                            .cornerRadius(12)
                    }
                }
            }
            .padding(32)
        }
    }
}

