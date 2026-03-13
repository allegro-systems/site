import Score

struct Layout<Content: Node>: Component {
    let content: Content

    init(@NodeBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some Node {
        Stack {
            SiteHeader()
            Main { content }
            SiteFooter()
        }
        .flex(.column)
        .size(minHeight: .percent(100))
        .background(.bg)
    }
}
