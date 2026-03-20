import Score

@Component
struct DocsPageNav {
    let docs: ContentCollection
    let current: ContentCollection.Item
    let pathPrefix: String

    var body: some Node {
        let items = docs.items
        let currentIndex = items.firstIndex(where: { $0.slug == current.slug })

        let prev: ContentCollection.Item? = currentIndex.flatMap { idx in
            idx > 0 ? items[idx - 1] : nil
        }
        let next: ContentCollection.Item? = currentIndex.flatMap { idx in
            idx + 1 < items.count ? items[idx + 1] : nil
        }

        Stack {
            Divider()
            Stack {
                if let prev {
                    Link(to: docsPath(for: prev.slug)) {
                        Stack {
                            Text { "\u{2190} Previous" }
                                .font(.mono, size: 12, color: .muted)
                            Text { prev.frontMatter?.string("title") ?? prev.slug }
                                .font(.mono, size: 14, weight: .medium, color: .accent)
                        }
                        .flex(.column, gap: 4)
                    }
                } else {
                    Stack {
                        Text { "\u{2190} Previous" }
                            .font(.mono, size: 12, color: .dimmer)
                        Text { "No previous page" }
                            .font(.mono, size: 14, color: .dimmer)
                    }
                    .flex(.column, gap: 4)
                }

                if let next {
                    Link(to: docsPath(for: next.slug)) {
                        Stack {
                            Text { "Next \u{2192}" }
                                .font(.mono, size: 12, color: .muted)
                            Text { next.frontMatter?.string("title") ?? next.slug }
                                .font(.mono, size: 14, weight: .medium, color: .accent)
                        }
                        .flex(.column, gap: 4, align: .end)
                    }
                } else {
                    Stack {
                        Text { "Next \u{2192}" }
                            .font(.mono, size: 12, color: .dimmer)
                        Text { "No next page" }
                            .font(.mono, size: 14, color: .dimmer)
                    }
                    .flex(.column, gap: 4, align: .end)
                }
            }
            .flex(.row, justify: .spaceBetween)
        }
        .flex(.column, gap: 24)
        .padding(48, at: .top)
        .padding(24, at: .bottom)
    }

    private func docsPath(for slug: String) -> String {
        DocsPath.path(for: slug, prefix: pathPrefix)
    }
}
