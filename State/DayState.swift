import Foundation
import Combine

final class DayState: ObservableObject {

    enum Status {
        case notStarted
        case answering
        case completed
    }

    @Published var status: Status = .notStarted

    var storageKey: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return "reflection_\(formatter.string(from: Date()))"
    }

    func saveReflection(_ text: String) {
        UserDefaults.standard.set(text, forKey: storageKey)
    }
}

