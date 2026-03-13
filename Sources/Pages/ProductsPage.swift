import Score

struct ProductsPage: Page {
    static let path = "/products"

    var body: some Node {
        Layout {
            Section {
                Heading(.one) { "Products" }
                    .font(.serif, size: 56, weight: .light, lineHeight: 1.15, color: .text, align: .center, wrap: .balance)
                    .size(maxWidth: 740)
                    .compact { $0.font(size: 36) }

                Paragraph { "A vertically integrated ecosystem of tools for the modern web \u{2014} from framework to deployment." }
                    .font(.mono, size: 15, lineHeight: 1.6, color: .muted, align: .center)
                    .size(maxWidth: 640)
                    .compact { $0.font(size: 14) }
            }
            .flex(.column, gap: 24, align: .center)
            .padding(120, at: .vertical)
            .padding(56, at: .horizontal)
            .backgroundGradient(.radial(color: .accent, opacity: 0.04, width: 120, height: 80, at: .top))
            .compact { $0.padding(80, at: .vertical).padding(20, at: .horizontal) }

            Divider()

            Section {
                Stack {
                    ProductCard(
                        title: "Score",
                        description: "The Swift web framework. Write components, compile to HTML, CSS and JS.",
                        accentColor: .score,
                        link: "/score"
                    )
                    ProductCard(
                        title: "Stage",
                        description: "The hosting and operations layer. Deploy, scale and observe Score applications.",
                        accentColor: .stage,
                        comingSoon: true
                    )
                    ProductCard(
                        title: "Composer",
                        description: "The native macOS and iPad visual editor. Build Score UIs without touching the compiler.",
                        accentColor: .composer,
                        comingSoon: true
                    )
                    ProductCard(
                        title: "Libretto",
                        description: "The first-party reference application. A proof-of-concept built entirely on Score and Stage.",
                        accentColor: .libretto,
                        comingSoon: true
                    )
                }
                .grid(columns: 2, gap: 20)
                .compact { $0.grid(columns: 1, gap: 16) }
            }
            .flex(.column, gap: 40)
            .padding(80, at: .vertical)
            .padding(56, at: .horizontal)
            .compact { $0.padding(60, at: .vertical).padding(20, at: .horizontal) }

        }
    }
}
