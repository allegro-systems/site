import Score

struct StageDocsPage: Page {
    static let path = "/docs/stage"

    var body: some Node {
        Layout(pagePath: Self.path) {
            ComingSoonDocsPage(
                product: "Stage",
                accentColor: .stage,
                pathPrefix: "/docs/stage",
                description: "Stage documentation is currently being written. Check back soon for guides on deployment, hosting, and observability."
            )
        }
    }
}
