import SwiftUI

struct Home: View {
    @State private var showAccount = false

    @ObservedObject var day: DayState

    
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            HStack {
                Spacer()
                Text("Perfil")
                    .font(.system(size: 13))
                    .foregroundColor(.secondary)
                    .onTapGesture {
                        showAccount = true
                    }
            }

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
        .sheet(isPresented: $showAccount) {
            AccountView()
        }

    }
}
