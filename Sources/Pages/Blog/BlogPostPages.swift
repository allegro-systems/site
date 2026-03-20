import Score

struct BlogPostPages: ContentPage {
    static let content = "Content/posts"
    static let prefix = "/blog"

    var item: ContentCollection.Item

    var body: some Node {
        Layout {
            Section {
                CategoryBadge(title: item.frontMatter?.string("category") ?? "")

                Text { DateFormatting.formatBlog(item.frontMatter?.string("date") ?? "") }
                    .font(.mono, size: 12, tracking: 1, color: .dimmer)

                Heading(.one) { item.frontMatter?.string("title") ?? "" }
                    .font(.serif, size: 42, weight: .medium, lineHeight: 1.1, color: .text)
                    .compact { $0.font(size: 30) }

                Paragraph { item.frontMatter?.string("excerpt") ?? "" }
                    .font(.mono, size: 15, lineHeight: 1.6, color: .muted)
                    .compact { $0.font(size: 14) }
            }
            .flex(.column, gap: 16, align: .center)
            .padding(80, at: .top)
            .padding(40, at: .bottom)
            .padding(56, at: .horizontal)
            .size(maxWidth: 720)
            .margin(0, at: .horizontal)
            .compact { $0.padding(60, at: .top).padding(20, at: .bottom).padding(20, at: .horizontal) }

            Stack {
                MarkdownNode(item.body)
            }
            .flex(.column, gap: 24)
            .padding(40, at: .vertical)
            .padding(56, at: .horizontal)
            .size(maxWidth: 720)
            .margin(0, at: .horizontal)
            .compact { $0.padding(20, at: .vertical).padding(20, at: .horizontal) }
        }
    }
}
