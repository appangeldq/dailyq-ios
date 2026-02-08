import SwiftUI

struct Reflection: View {

    @ObservedObject var day: DayState
    @State private var text: String = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 32) {

            Text("Reflexión")
                .font(.system(size: 15))

            TextEditor(text: $text)
                .frame(minHeight: 200)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.secondary.opacity(0.3))
                )

            Spacer()

            Button("Guardar") {
                day.saveReflection(text)
                day.status = .completed
            }

        }
        .padding(32)
    }
}
