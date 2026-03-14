import Score

struct HomePage: Page {
    static let path = "/"

    var body: some Node {
        Layout {
            Section {
                Heading(.one) { "Taking your ideas\nfrom score to stage" }
                    .font(.serif, size: 56, weight: .light, lineHeight: 1.15, color: .text, align: .center, wrap: .balance)
                    .size(maxWidth: 740)
                    .compact { $0.font(size: 36) }

                Paragraph { "A Swift-first ecosystem of tools for building, hosting, and publishing on the modern web." }
                    .font(.mono, size: 15, lineHeight: 1.6, color: .muted, align: .center)
                    .size(maxWidth: 580)
                    .compact { $0.font(size: 13) }

                Stack {
                    SiteButton(title: "Get Started", link: "/docs", variant: .primary(.accent))
                    SiteButton(title: "View on GitHub", link: "https://github.com/allegro-systems", variant: .secondary, opensInNewTab: true)
                }
                .flex(.row, gap: 16, align: .center)
                .compact { $0.flex(.column, gap: 12).size(width: .percent(100)) }
            }
            .flex(.column, gap: 28, align: .center)
            .padding(120, at: .vertical)
            .padding(56, at: .horizontal)
            .backgroundGradient(.radial(color: .accent, opacity: 0.04, width: 120, height: 80, at: .top))
            .compact { $0.padding(80, at: .vertical).padding(20, at: .horizontal) }

            Divider()

            Section {
                SectionLabel(title: "Products")

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
                .desktop { $0.grid(columns: 4, gap: 20) }
                .compact { $0.grid(columns: 1, gap: 16) }
            }
            .flex(.column, gap: 40)
            .padding(80, at: .vertical)
            .padding(56, at: .horizontal)
            .compact { $0.padding(60, at: .vertical).padding(20, at: .horizontal) }

            Divider()

            Section {
                SectionLabel(title: "Why Allegro")

                Stack {
                    FeatureCard(
                        icon: "zap",
                        title: "Swift-First",
                        description: "Built from the ground up in Swift. No wrappers, no compromises \u{2014} just native performance and type safety."
                    )
                    FeatureCard(
                        icon: "layers",
                        title: "Integrated by Design",
                        description: "Score, Stage, Composer, and Libretto work together as one cohesive system \u{2014} no glue code required."
                    )
                    FeatureCard(
                        icon: "book-open",
                        title: "Open and Transparent",
                        description: "Open-source core with a commitment to developer freedom. Inspect, extend, and contribute."
                    )
                }
                .grid(columns: 3, gap: 20)
                .tablet { $0.grid(columns: 2, gap: 20) }
                .compact { $0.grid(columns: 1, gap: 16) }
            }
            .flex(.column, gap: 40)
            .padding(80, at: .vertical)
            .padding(56, at: .horizontal)
            .compact { $0.padding(60, at: .vertical).padding(20, at: .horizontal) }

            Section {
                SectionLabel(title: "Documentation")

                Stack {
                    DocCard(
                        title: "Score Docs",
                        description: "Guides, API reference and tutorials for the Score framework.",
                        accentColor: .score,
                        link: "/docs/score"
                    )
                    DocCard(
                        title: "Stage Docs",
                        description: "Deployment guides, scaling configuration and observability setup.",
                        accentColor: .stage,
                        comingSoon: true
                    )
                    DocCard(
                        title: "Composer Docs",
                        description: "Visual editor workflows, component library and export options.",
                        accentColor: .composer,
                        comingSoon: true
                    )
                }
                .grid(columns: 3, gap: 20)
                .tablet { $0.grid(columns: 2, gap: 20) }
                .compact { $0.grid(columns: 1, gap: 16) }
            }
            .flex(.column, gap: 40)
            .padding(80, at: .vertical)
            .padding(56, at: .horizontal)
            .compact { $0.padding(60, at: .vertical).padding(20, at: .horizontal) }
        }
    }
}
