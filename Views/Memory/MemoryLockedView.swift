import SwiftUI

struct MemoryLockedView: View {

    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(alignment: .leading, spacing: 32) {

            Spacer()

            Text("Hay ideas que merecen guardarse.")
                .font(.system(size: 15))

            Text("Guarda reflexiones y vuelve a ellas cuando quieras.")
                .font(.system(size: 13))
                .foregroundColor(.secondary)

            Spacer()

            Button("Desbloquear memoria") {
                // más adelante Pro
            }

            Button("Volver") {
                dismiss()
            }
            .foregroundColor(.secondary)
        }
        .padding(32)
    }
}
