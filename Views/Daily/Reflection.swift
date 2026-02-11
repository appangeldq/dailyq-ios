import SwiftUI

struct Reflection: View {

    @ObservedObject var day: DayState
    let question: DailyQuestion

    @State private var text: String = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 32) {

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
            .frame(height: 44)
            .padding(.bottom, 32)


            // Texto editorial (reflexión guiada)
            VStack(alignment: .leading, spacing: 24) {

                Text("Reflexión")
                    .font(.system(size: 13))
                    .foregroundColor(Color("TextTertiary"))

                ScrollView {
                    Text(question.reflectionText
                            .replacingOccurrences(of: "\\n", with: "\n"))
                        .font(.system(size: 15))
                        .foregroundColor(Color("TextPrimary"))
                        .multilineTextAlignment(.leading)
                }
                .frame(maxHeight: 300)

            }
            .padding(.horizontal, 32)
            .padding(.vertical, 40)
            .background(Color("BackgroundSecondary"))
            .cornerRadius(12)
            .padding(.bottom, 40)



            // Campo de escritura
            ZStack(alignment: .topLeading) {

                // Placeholder
                if text.isEmpty {
                    Text("Escribe alguna idea…")
                        .font(.system(size: 15))
                        .foregroundColor(Color("TextSecondary"))
                        .padding(.top, 16)
                        .padding(.leading, 16)
                        .zIndex(1)
                        .allowsHitTesting(false)
                }

                // Editor
                TextEditor(text: $text)
                    .font(.system(size: 15))
                    .padding(12)
                    .background(Color.clear)
                    .zIndex(0)

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
            .padding(.bottom, 32)




            Spacer()

            // CTA
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
        .padding(32)
        .onAppear {
            text = "" // siempre partir en blanco
        }
    }
}
