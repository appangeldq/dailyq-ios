import SwiftUI

struct Reflection: View {

    @ObservedObject var day: DayState
    let question: DailyQuestion

    @State private var text: String = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 32) {

            // Header
            VStack(alignment: .leading, spacing: 8) {
                DQSubtitle(text: question.category)
                DQTitle(text: question.questionText)
            }

            // Texto editorial (reflexión guiada)
            Text(question.reflectionText)
                .font(.system(size: 15))
                .foregroundColor(Color("TextSecondary"))
                .multilineTextAlignment(.leading)

            // Campo de escritura
            TextEditor(text: $text)
                .font(.system(size: 15))
                .frame(minHeight: 160)
                .padding(12)
                .background(Color("BackgroundSecondary"))
                .cornerRadius(12)

            Spacer()

            // CTA
            Button {
                day.saveReflection(text)
                day.status = .completed
            } label: {
                Text("Guardar reflexión")
                    .font(.system(size: 15))
                    .foregroundColor(Color("BackgroundPrimary"))
                    .frame(maxWidth: .infinity)
                    .padding()
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
