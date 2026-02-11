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
            if let question = DailyQuestionLoader.questionForToday() {
                Reflection(day: day, question: question)
            }


        case .completed:
            Completed(day: day)
        }
    }
}


