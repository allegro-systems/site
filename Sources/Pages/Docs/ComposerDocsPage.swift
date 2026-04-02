import Score

struct ComposerDocsPage: Page {
    static let path = "/docs/composer"

    var body: some Node {
        Layout(pagePath: Self.path) {
            ComingSoonDocsPage(
                product: "Composer",
                accentColor: .composer,
                pathPrefix: "/docs/composer",
                description: "Composer documentation is currently being written. Check back soon for guides on the visual editor, canvas workflows, and component library."
            )
        }
    }
}
