import SwiftUI

struct Home: View {

    @ObservedObject var day: DayState

    var body: some View {
        VStack(alignment: .leading, spacing: 32) {

            Text("Pregunta del día")
                .font(.system(size: 15))

            Text("No hay respuestas correctas.")
                .font(.system(size: 13))
                .foregroundColor(.secondary)

            Spacer()

            Button("Reflexionar") {
                day.status = .answering
            }
        }
        .padding(32)
    }
}
