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
                        DQTitle(text: "Memoria")
                        DQSubtitle(text: "Un registro de tus ideas a lo largo del tiempo")

                            
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

                    DQTitle(text: "Hay ideas que merecen guardarse.")
                    DQSubtitle(text: "Guarda reflexiones y vuelve a ellas cuando quieras.")

                        

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

