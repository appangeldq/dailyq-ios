import Foundation

struct MemoryItem: Identifiable {
    let id = UUID()
    let date: Date
    let question: String
    let note: String?
}


