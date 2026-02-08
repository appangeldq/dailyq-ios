import SwiftUI

struct MemoryFreeView: View {

    @State private var showLocked = false

    let memories = MemoryLoader.load()

    var body: some View {
        VStack(alignment: .leading, spacing: 32) {

            Text("Memoria")
                .font(.system(size: 15))

            ForEach(memories) { memory in
                VStack(alignment: .leading, spacing: 8) {

                    Text(memory.date.formatted(date: .long, time: .omitted))
                        .font(.system(size: 12))
                        .foregroundColor(.secondary)

                    Text(memory.text)
                        .font(.system(size: 13))
                        .lineLimit(3)
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(12)
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

