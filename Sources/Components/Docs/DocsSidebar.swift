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
                        ProductPill(title: product, color: accentColor)
                        Text { "Documentation" }
                            .font(.mono, size: 13, weight: .regular, color: .muted)
                    }
                    .flex(.row, gap: 6, align: .center)

                    Link(to: "/docs") {
                        Text { "\u{2190} Back to Docs" }
                            .font(.mono, size: 12, color: .muted, decoration: TextDecoration.none)
                    }

                    Divider()

                    if let docs {
                        Stack {
                            for item in docs.items {
                                Link(to: docsPath(for: item.slug)) {
                                    Text { item.frontMatter?.string("title") ?? item.slug }
                                        .font(.mono, size: 14, color: .muted, decoration: TextDecoration.none)
                                        .hover { $0.font(color: accentColor) }
                                        .padding(8, at: .vertical)
                                        .padding(12, at: .horizontal)
                                }
                            }
                        }
                        .flex(.column, gap: 4)
                    } else {
                        Text { "Coming Soon" }
                            .font(.mono, size: 13, color: .dimmer)
                            .padding(8, at: .vertical)
                            .padding(12, at: .horizontal)
                    }
                }
                .flex(.column, gap: 24)
            }
        }
        .size(width: 320)
        .padding(32, at: .vertical)
        .padding(24, at: .horizontal)
        .background(.surface)
        .border(width: 1, color: .border, style: .solid, at: .trailing)
        .compact { $0.display(.none) }
    }

    private func docsPath(for slug: String) -> String {
        DocsPath.path(for: slug, prefix: pathPrefix)
    }
}
