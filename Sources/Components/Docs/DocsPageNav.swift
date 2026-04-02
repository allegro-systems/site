import AllegroTheme
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
                                .font(.mono, size: 14, weight: .medium, color: .text)
                        }
                        .flex(.column, gap: 4)
                    }
                    .font(decoration: TextDecoration.none)
                    .padding(12, at: .horizontal)
                    .padding(10, at: .vertical)
                    .border(radius: 8)
                    .hover { $0.background(.elevated).font(decoration: TextDecoration.none) }
                }

                if let next {
                    Link(to: docsPath(for: next.slug)) {
                        Stack {
                            Text { "Next \u{2192}" }
                                .font(.mono, size: 12, color: .muted)
                            Text { next.frontMatter?.string("title") ?? next.slug }
                                .font(.mono, size: 14, weight: .medium, color: .text)
                        }
                        .flex(.column, gap: 4, align: .end)
                    }
                    .font(decoration: TextDecoration.none)
                    .padding(12, at: .horizontal)
                    .padding(10, at: .vertical)
                    .border(radius: 8)
                    .hover { $0.background(.elevated).font(decoration: TextDecoration.none) }
                }
            }
            .flex(.row, justify: .spaceBetween)
        }
        .flex(.column, gap: 24)
        .padding(48, at: .top)
        .padding(24, at: .bottom)
    }

    private func docsPath(for slug: String) -> String {
        slug.docsPath(prefix: pathPrefix)
    }
}
