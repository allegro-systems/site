enum DocsPath {
    static func path(for slug: String, prefix: String) -> String {
        "\(prefix)/\(slug == "index" ? "" : slug)"
    }
}
