import SwiftUI

struct MemoryFreeView: View {

    @State private var showLocked = false

    let memories = MemoryLoader.load()

    var body: some View {
        VStack(alignment: .leading, spacing: 32) {

            Text("Memoria")
                .font(.system(size: 15))

            ForEach(memories) { memory in
                MemoryCardView(memory: memory)
                    .onTapGesture {
                        showLocked = true
                    }
            }


            Spacer()
        }
        .padding(32)
        .sheet(isPresented: $showLocked) {
            MemoryLockedView()
        }

    }
}

