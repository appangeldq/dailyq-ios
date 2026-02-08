import SwiftUI

struct MemoryFreeView: View {

    let memories = MemoryLoader.load(limit: 3)
    @State private var isLocked = false

    var body: some View {
        ZStack {

            // ESTADO FREE
            if !isLocked {
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
                                .frame(maxWidth: 330)
                                .onTapGesture {
                                    withAnimation(.easeInOut(duration: 0.25)) {
                                        isLocked = true
                                    }
                                }
                        }
                    }

                    Spacer()

                    // FOOTER
                    Text("Desbloquear memoria.")
                        .font(.system(size: 15))
                        .foregroundColor(Color("TextTertiary"))
                }
                .padding(32)
                .background(Color("BackgroundPrimary"))
                .transition(.opacity)
            }

            // ESTADO BLOQUEADO
            if isLocked {
                VStack(alignment: .leading, spacing: 32) {

                    Spacer()

                    Text("Hay ideas que merecen guardarse.")
                        .font(.system(size: 15))
                        .foregroundColor(Color("TextPrimary"))

                    Text("Guarda reflexiones y vuelve a ellas cuando quieras.")
                        .font(.system(size: 13))
                        .foregroundColor(
                            Color("TextSecondary").opacity(0.6)
                        )

                    Spacer()

                    Text("Desbloquear memoria.")
                        .font(.system(size: 15))
                        .foregroundColor(Color("TextTertiary"))

                    Button("Volver") {
                        withAnimation(.easeInOut(duration: 0.25)) {
                            isLocked = false
                        }
                    }
                    .font(.system(size: 13))
                    .foregroundColor(
                        Color("TextSecondary").opacity(0.6)
                    )
                }
                .padding(32)
                .background(Color("BackgroundPrimary"))
                .transition(.opacity)
            }
        }
    }
}

