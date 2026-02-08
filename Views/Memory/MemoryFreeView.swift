import SwiftUI

struct MemoryFreeView: View {

    @State private var showLocked = false

    let memories = MemoryLoader.load()

    var body: some View {
        // LISTA / EMPTY STATE
        if memories.isEmpty {

            VStack(alignment: .leading, spacing: 8) {
                Text("Aún no hay reflexiones guardadas.")
                    .font(.system(size: 15))
                    .foregroundColor(Color("TextPrimary"))

                Text("Cuando escribas tus ideas, aparecerán aquí.")
                    .font(.system(size: 13))
                    .foregroundColor(Color("TextSecondary").opacity(0.6))
            }
            .padding(.top, 32)

        } else {

            VStack(spacing: 32) {
                ForEach(memories) { memory in
                    MemoryCardView(memory: memory)
                        .onTapGesture {
                            showLocked = true
                        }
                }
            }
        }



            Spacer()
        
        .padding(32)
        .sheet(isPresented: $showLocked) {
            MemoryLockedView()
        }
    }
}
