extension String {
    func formatBlogDate() -> String {
        let parts = split(separator: "-")
        guard parts.count == 3 else { return self }
        return "\(parts[0]) \u{00B7} \(parts[1]) \u{00B7} \(parts[2])"
    }
}
