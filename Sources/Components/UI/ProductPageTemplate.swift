import AllegroTheme
import Score

struct ProductPageHero {
    let pill: String
    let color: ColorToken
    let title: String
    let subtitle: String
    let description: String
    let descriptionMaxWidth: Length
    let primaryButton: (title: String, link: String)
    let secondaryButton: (title: String, link: String, opensInNewTab: Bool)
}

struct ProductPageFeature {
    let icon: String
    let title: String
    let description: String
    let large: Bool

    init(icon: String, title: String, description: String, large: Bool = false) {
        self.icon = icon
        self.title = title
        self.description = description
        self.large = large
    }
}

struct ProductPageHighlight {
    let title: String
    let description: String
}

@Component
struct ProductPageTemplate {
    let hero: ProductPageHero
    let features: [[ProductPageFeature]]
    let highlights: [ProductPageHighlight]
    let content: Content

    var body: some Node {
        Layout {
            // Hero
            Section {
                ProductPill(hero.pill, color: hero.color)

                Stack {
                    Heading(.one) { hero.title }
                        .font(.serif, size: 56, weight: .light, lineHeight: 1.15, color: .text, align: .center, wrap: .balance)
                        .size(maxWidth: 740)
                        .compact { $0.font(size: 36) }
                        .animate(.fadeIn, duration: 0.6)

                    Text { hero.subtitle }
                        .font(.mono, size: 15, color: .muted)
                        .animate(.fadeIn, duration: 0.6, delay: 0.1)
                }
                .flex(.column, gap: 8, align: .center)

                Paragraph { hero.description }
                    .font(.mono, size: 13, lineHeight: 1.6, color: .muted, align: .center)
                    .size(maxWidth: hero.descriptionMaxWidth)

                Stack {
                    ActionLink(
                        to: hero.primaryButton.link,
                        label: hero.primaryButton.title,
                        large: true
                    )
                    ActionLink(
                        to: hero.secondaryButton.link,
                        label: hero.secondaryButton.title,
                        primary: false,
                        large: true
                    )
                }
                .flex(.row, gap: 16, align: .center)
                .compact { $0.flex(.column, gap: 12).size(width: .percent(100)) }

                if Environment.current == .development {
                    DevToolsToggle()
                }
            }
            .flex(.column, gap: 24, align: .center, justify: .center)
            .size(height: 600)
            .padding(80, at: .vertical)
            .padding(56, at: .horizontal)
            .backgroundGradient(.radial(color: hero.color, opacity: 0.04, width: 120, height: 80, at: .top))
            .compact { $0.padding(80, at: .vertical).padding(20, at: .horizontal) }

            Divider()

            // Features
            Section {
                Heading(.two) { "What You Get" }
                    .font(.serif, size: 32, weight: .light, color: .text)
                    .compact { $0.font(size: 28) }

                for row in features {
                    Stack {
                        for feature in row {
                            FeatureCard(
                                icon: feature.icon,
                                title: feature.title,
                                description: feature.description,
                                accentColor: hero.color,
                                large: feature.large
                            )
                        }
                    }
                    .grid(columns: 2, gap: 20)
                    .compact { $0.grid(columns: 1, gap: 16) }
                }
            }
            .flex(.column, gap: 32)
            .padding(60, at: .vertical)
            .padding(56, at: .horizontal)
            .compact { $0.padding(40, at: .vertical).padding(20, at: .horizontal) }

            Divider()

            // Highlights
            Section {
                Heading(.two) { "Highlights" }
                    .font(.serif, size: 32, weight: .light, color: .text)
                    .compact { $0.font(size: 28) }

                Stack {
                    for highlight in highlights {
                        Stack {
                            Heading(.three) { highlight.title }
                                .font(.serif, size: 20, weight: .light, color: .text)

                            Paragraph { highlight.description }
                                .font(.mono, size: 13, lineHeight: 1.6, color: .muted)
                        }
                        .flex(.column, gap: 12)
                    }
                }
                .grid(columns: 3, gap: 32)
                .tablet { $0.grid(columns: 2, gap: 20) }
                .compact { $0.grid(columns: 1, gap: 24) }
            }
            .flex(.column, gap: 32)
            .padding(32, at: .vertical)
            .padding(56, at: .horizontal)
            .compact { $0.padding(24, at: .vertical).padding(20, at: .horizontal) }

            Divider()

            // Additional sections
            content
        }
    }
}
