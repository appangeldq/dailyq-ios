import Foundation

struct DailyQuestion: Identifiable, Codable {
    let id: String
    let questionText: String
    let reflectionText: String
    let category: String
    let dayOfWeek: String
    let language: String
    let isActive: Bool

    enum CodingKeys: String, CodingKey {
        case id
        case questionText = "question_text"
        case reflectionText = "reflection_text"
        case category
        case dayOfWeek = "day_of_week"
        case language
        case isActive = "is_active"
    }
}

