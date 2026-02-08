import Foundation
import Combine

final class DayState: ObservableObject {

    enum Status {
        case notStarted
        case answering
        case completed
    }

    @Published var status: Status = .notStarted
}

