import Score

struct Layout<Content: Node>: Component {
    let content: Content
    let pagePath: String

    init(pagePath: String = "/", @NodeBuilder content: () -> Content) {
        self.pagePath = pagePath
        self.content = content()
    }

    var body: some Node {
        Stack {
            SiteHeader(pagePath: pagePath)
            Main { content }
            SiteFooter()
        }
        .flex(.column)
        .size(minHeight: .percent(100))
        .background(.bg)
    }
}
