import Score

struct ScoreDocsPages: ContentPage {
    static let content = "Content/docs/score"
    static let prefix = "/docs/score"

    var item: ContentCollection.Item

    var body: some Node {
        let docs = ContentCollection(loading: Self.content).sorted(by: "order")

        Layout {
            Stack {
                DocsSidebar(
                    product: "Score",
                    accentColor: .score,
                    docs: docs,
                    pathPrefix: Self.prefix
                )

                Stack {
                    Heading(.one) { item.frontMatter?.string("title") ?? "" }
                        .font(.serif, size: 36, weight: .medium, lineHeight: 1.15, color: .text)
                        .compact { $0.font(size: 28) }
                        .padding(48, at: .top)
                        .padding(32, at: .bottom)

                    MarkdownNode(item.body)

                    DocsPageNav(docs: docs, current: item, pathPrefix: Self.prefix)
                }
                .flex(.column)
                .padding(40, at: .vertical)
                .padding(56, at: .horizontal)
                .flexItem(grow: 1)
                .compact { $0.padding(20, at: .vertical).padding(20, at: .horizontal) }
            }
            .flex(.row)
        }
    }
}
