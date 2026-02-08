import SwiftUI

struct AccountView: View {

    @State private var showMemory = false

    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(alignment: .leading, spacing: 32) {

            HStack {
                Spacer()
                Button("Cerrar") {
                    dismiss()
                }
            }

            Text("Cuenta")
                .font(.system(size: 15))

            Button {
                showMemory = true
            } label: {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Memoria")
                        .font(.system(size: 15))

                    Text("Tus reflexiones guardadas")
                        .font(.system(size: 13))
                        .foregroundColor(.secondary)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(12)
            }


            Spacer()
        }
        .padding(32)
        .sheet(isPresented: $showMemory) {
            MemoryFreeView()
        }

    }
}

