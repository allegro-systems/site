import AllegroTheme
import Score

@Component
struct DocsSidebar {
    let product: String
    let accentColor: ColorToken
    var docs: ContentCollection? = nil
    let pathPrefix: String

    var body: some Node {
        Aside {
            Navigation {
                Stack {
                    Stack {
                        ProductPill(product, color: accentColor)
                        Text { "Documentation" }
                            .font(.mono, size: 13, weight: .regular, color: .muted)
                    }
                    .flex(.row, gap: 6, align: .center)

                    Link(to: "/docs") { "\u{2190} Back to Docs" }
                        .font(.mono, size: 12, color: .muted, decoration: TextDecoration.none)
                        .hover { $0.font(color: .text, decoration: TextDecoration.none) }

                    Divider()

                    if let docs {
                        Stack {
                            for item in docs.items {
                                Link(to: docsPath(for: item.slug)) {
                                    item.frontMatter?.string("title") ?? item.slug
                                }
                                .font(.mono, size: 14, color: .muted, decoration: TextDecoration.none)
                                .padding(8, at: .vertical)
                                .padding(12, at: .horizontal)
                                .border(radius: 6)
                                .hover { $0.font(color: accentColor, decoration: TextDecoration.none).background(.elevated) }
                            }
                        }
                        .flex(.column, gap: 2)
                    } else {
                        Text { "Coming Soon" }
                            .font(.mono, size: 13, color: .dimmer)
                            .padding(8, at: .vertical)
                            .padding(12, at: .horizontal)
                    }
                }
                .flex(.column, gap: 24)
            }
            .position(.sticky, top: 0)
            .padding(32, at: .vertical)
            .padding(24, at: .horizontal)
            .size(maxHeight: .percent(100))
            .overflow(y: .auto)
        }
        .size(width: 320)
        .flex(shrink: 0)
        .background(.surface)
        .border(width: 1, color: .border, style: .solid, at: .trailing)
        .compact { $0.display(.none) }
    }

    private func docsPath(for slug: String) -> String {
        slug.docsPath(prefix: pathPrefix)
    }
}
