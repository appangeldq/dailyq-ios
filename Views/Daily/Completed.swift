import SwiftUI

struct Completed: View {

    @ObservedObject var day: DayState

    var body: some View {
        VStack(alignment: .leading, spacing: 32) {

            Text("Hoy ya te tomaste un momento para pensar.")
                .font(.system(size: 15))

            Spacer()

            Button("Volver al inicio") {
                day.status = .notStarted
            }
        }
        .padding(32)
    }
}
