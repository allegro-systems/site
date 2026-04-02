import AllegroTheme
import Score

struct DocsPage: Page {
    static let path = "/docs"

    var body: some Node {
        Layout(pagePath: Self.path) {
            Section {
                Heading(.one) { "Documentation" }
                    .font(.serif, size: 56, weight: .light, lineHeight: 1.15, color: .text, align: .center)
                    .size(maxWidth: 740)
                    .compact { $0.font(size: 36) }

                Paragraph { "Everything you need to build with the Allegro ecosystem" }
                    .font(.mono, size: 15, lineHeight: 1.6, color: .muted, align: .center)
                    .size(maxWidth: 580)
            }
            .flex(.column, gap: 24, align: .center)
            .padding(100, at: .vertical)
            .padding(56, at: .horizontal)
            .backgroundGradient(.radial(color: .score, opacity: 0.04, width: 100, height: 60, at: .top))
            .compact { $0.padding(80, at: .vertical).padding(20, at: .horizontal) }

            Divider()

            Section {
                SectionLabel("Documentation")

                Stack {
                    DocCard(
                        title: "Score",
                        description: "Framework, runtime model, components, CLI, and build artifacts.",
                        accentColor: .score,
                        link: "/docs/score",
                        filled: true
                    )
                    DocCard(
                        title: "Stage",
                        description: "Hosting, deployment, and observability.",
                        accentColor: .stage,
                        link: "/docs/stage",
                        comingSoon: true,
                        filled: true
                    )
                    DocCard(
                        title: "Composer",
                        description: "Native visual editor and GUI workflows.",
                        accentColor: .composer,
                        link: "/docs/composer",
                        comingSoon: true,
                        filled: true
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

            Paragraph { "Libretto has no standalone documentation \u{2014} it is documented through Score and Stage." }
                .font(.mono, size: 13, lineHeight: 1.6, color: .dimmer, align: .center)
                .padding(40, at: .vertical)
                .padding(56, at: .horizontal)
        }
    }
}
