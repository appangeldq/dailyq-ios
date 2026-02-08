import SwiftUI

struct DailyFlowView: View {

    let todayQuestion = DailyQuestionLoader.questionForToday()

    @ObservedObject var day: DayState

    var body: some View {
        switch day.status {
        case .notStarted:
            if let question = DailyQuestionLoader.questionForToday() {
                Home(day: day, question: question)
            }


        case .answering:
            Reflection(day: day)

        case .completed:
            Completed(day: day)
        }
    }
}


