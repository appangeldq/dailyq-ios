import SwiftUI

struct DailyFlowView: View {

    @ObservedObject var day: DayState

    var body: some View {
        switch day.status {
        case .notStarted:
            Home(day: day)

        case .answering:
            Reflection(day: day)

        case .completed:
            Completed(day: day)
        }
    }
}


