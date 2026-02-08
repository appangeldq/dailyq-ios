import SwiftUI

struct DailyFlowView: View {

    @ObservedObject var day: DayState

    var body: some View {
        switch day.status {
        case .notStarted:
            Home(day: day)

        case .answering:
            Text("Answering")

        case .completed:
            Text("Completed")
        }
    }
}

