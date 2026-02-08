import Foundation

struct MemoryLoader {

    static func load(limit: Int = 3) -> [MemoryItem] {

        let defaults = UserDefaults.standard
        let keys = defaults.dictionaryRepresentation().keys
            .filter { $0.hasPrefix("reflection_") }

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"

        let items: [MemoryItem] = keys.compactMap { key in
            guard
                let dateString = key.replacingOccurrences(of: "reflection_", with: "") as String?,
                let date = formatter.date(from: dateString),
                let text = defaults.string(forKey: key)
            else {
                return nil
            }

            return MemoryItem(date: date, text: text)
        }

        return items
            .sorted { $0.date > $1.date }
            .prefix(limit)
            .map { $0 }
    }
}
