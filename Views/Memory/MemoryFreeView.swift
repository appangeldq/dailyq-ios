import SwiftUI

struct MemoryFreeView: View {

    let memories = MemoryLoader.load(limit: 3)
    @State private var showLocked = false

    var body: some View {
        VStack(alignment: .leading, spacing: 32) {

            // HEADER
            VStack(alignment: .leading, spacing: 8) {
                Text("Memoria")
                    .font(.system(size: 15))
                    .foregroundColor(Color("TextPrimary"))

                Text("Un registro de tus ideas a lo largo del tiempo")
                    .font(.system(size: 13))
                    .foregroundColor(
                        Color("TextSecondary").opacity(0.6)
                    )
            }

            // CARDS
            VStack(spacing: 32) {
                ForEach(memories) { memory in
                    MemoryCardView(memory: memory)
                        .frame(maxWidth: 330) // ancho visual de card (ajustable)
                        .onTapGesture {
                            showLocked = true
                        }
                }
            }
            .frame(maxWidth: .infinity, alignment: .center)


            Spacer()

            // FOOTER
            Text("Desbloquear memoria.")
                .font(.system(size: 15))
                .foregroundColor(Color("TextTertiary"))
        }
        .padding(32)
        .background(Color("BackgroundPrimary"))
        .sheet(isPresented: $showLocked) {
            MemoryLockedView()
        }
    }
}

