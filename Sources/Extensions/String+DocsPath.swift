extension String {
    func docsPath(prefix: String) -> String {
        "\(prefix)/\(self == "index" ? "" : self)"
    }
}
