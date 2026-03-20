enum DateFormatting {
    static func formatBlog(_ date: String) -> String {
        let parts = date.split(separator: "-")
        guard parts.count == 3 else { return date }
        return "\(parts[0]) \u{00B7} \(parts[1]) \u{00B7} \(parts[2])"
    }
}
