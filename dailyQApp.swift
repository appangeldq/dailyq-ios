import SwiftUI

@main
struct DailyQApp: App {

    @StateObject private var day = DayState()

    var body: some Scene {
        WindowGroup {
            DailyFlowView(day: day)

        }
    }
}


