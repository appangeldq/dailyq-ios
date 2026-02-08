import Foundation

final class DailyQuestionLoader {

    static func load() -> [DailyQuestion] {
        guard
            let url = Bundle.main.url(forResource: "daily_questions", withExtension: "json"),
            let data = try? Data(contentsOf: url),
            let questions = try? JSONDecoder().decode([DailyQuestion].self, from: data)
        else {
            print("❌ Error cargando daily_questions.json")
            return []
        }

        return questions
    }

    static func questionForToday() -> DailyQuestion? {
        let all: [DailyQuestion] = load()

        let filtered: [DailyQuestion] = all.filter { question in
            question.isActive && question.language == "es"
        }

        guard !filtered.isEmpty else { return nil }

        let today = Date().weekdayString
        let lastID = UserDefaults.standard.string(forKey: "last_question_id")

        let affinity: [DailyQuestion] = filtered.filter { question in
            question.dayOfWeek.lowercased() == today && question.id != lastID
        }

        let pool: [DailyQuestion]

        if !affinity.isEmpty {
            pool = affinity
        } else {
            pool = filtered.filter { question in
                question.id != lastID
            }
        }

        let finalPool = pool.isEmpty ? filtered : pool
        let question = finalPool.randomElement()

        if let id = question?.id {
            UserDefaults.standard.set(id, forKey: "last_question_id")
        }

        return question
    }
}

