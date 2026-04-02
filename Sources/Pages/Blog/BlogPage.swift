import Score

struct BlogPage: Page {
    static let path = "/blog"

    var metadata: (any Metadata)? {
        SiteMetadata(
            title: t("meta.blog.title", default: "Blog"),
            description: t("meta.blog.description", default: "Architectural notes, design decisions, and build updates from the Allegro team.")
        )
    }

    var body: some Node {
        let posts = ContentCollection(loading: "Content/posts").sorted(by: "date", ascending: false)

        Layout(pagePath: Self.path) {
            Section {
                Heading(.one) { "Blog" }
                    .font(.serif, size: 48, weight: .medium, lineHeight: 1.05, color: .text, align: .center, wrap: .balance)
                    .compact { $0.font(size: 36) }

                Paragraph { "Architectural notes, design decisions, and build updates." }
                    .font(.mono, size: 14, color: .muted, align: .center)
                    .compact { $0.font(size: 13) }
            }
            .flex(.column, gap: 16, align: .center)
            .padding(80, at: .top)
            .padding(60, at: .bottom)
            .padding(56, at: .horizontal)
            .backgroundGradient(.radial(color: .accent, opacity: 0.04, width: 120, height: 100, at: .center))
            .compact { $0.flex(.column, gap: 12, align: .center).padding(60, at: .top).padding(20, at: .bottom).padding(20, at: .horizontal) }

            Stack {
                Text { "All" }
                    .font(.mono, size: 13, weight: .medium, color: .accent)
                    .padding(4, at: .vertical)
                    .padding(12, at: .horizontal)
                    .background(.elevated)
                    .border(radius: 3)
                for category in posts.uniqueValues(for: "category") {
                    Text { category }
                        .font(.mono, size: 13, color: .muted)
                }
            }
            .flex(.row, gap: 12, align: .center)
            .padding(24, at: .vertical)
            .padding(56, at: .horizontal)
            .compact { $0.padding(16, at: .vertical).padding(20, at: .horizontal).flex(.row, gap: 12, align: .center, wraps: true) }

            Stack {
                for (index, item) in posts.items.enumerated() {
                    BlogPostEntry(
                        category: item.frontMatter?.string("category") ?? "",
                        date: (item.frontMatter?.string("date") ?? "").formatBlogDate(),
                        title: item.frontMatter?.string("title") ?? "",
                        excerpt: item.frontMatter?.string("excerpt") ?? "",
                        link: "/blog/\(item.slug)",
                        isLast: index == posts.items.count - 1
                    )
                }
            }
            .flex(.column)
            .padding(40, at: .vertical)
            .padding(56, at: .horizontal)
            .compact { $0.padding(0, at: .vertical).padding(20, at: .horizontal) }
        }
    }
}
