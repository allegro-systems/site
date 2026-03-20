import Score

/// Shared layout for product pages that are not yet available.
///
/// Renders a hero section with product badge, heading, subtitle, and
/// description, followed by an email capture section and a grid of
/// ``ComingSoonCard`` items describing what to expect.
@Component
struct ComingSoonProductLayout {
    let name: String
    let accentColor: ColorToken
    let heading: String
    let subtitle: String
    let description: String
    let highlights: String
    let gradient: RadialGradient
    var descriptionMaxWidth: Length = 580
    let features: [Feature]

    struct Feature: Sendable {
        let icon: String
        let title: String
        let description: String
    }

    var body: some Node {
        Layout {
            Section {
                Stack {
                    ProductPill(title: name, color: accentColor)
                }
                .flex(.row, justify: .center)

                Heading(.one) { heading }
                    .font(.serif, size: 56, weight: .light, lineHeight: 1.15, color: .text, align: .center, wrap: .balance)
                    .size(maxWidth: 740)
                    .compact { $0.font(size: 36) }

                Text { subtitle }
                    .font(.mono, size: 15, color: .muted)

                Paragraph { description }
                    .font(.mono, size: 13, color: .dimmer, align: .center)
                    .size(maxWidth: descriptionMaxWidth)
            }
            .flex(.column, gap: 16, align: .center)
            .padding(120, at: .top)
            .padding(48, at: .bottom)
            .padding(56, at: .horizontal)
            .backgroundGradient(gradient)
            .compact { $0.padding(80, at: .top).padding(32, at: .bottom).padding(20, at: .horizontal) }

            Section {
                Text { highlights }
                    .font(.mono, size: 12, color: .dimmer, align: .center)

                EmailCapture()
            }
            .flex(.column, gap: 24, align: .center)
            .padding(24, at: .vertical)
            .padding(56, at: .horizontal)
            .compact { $0.padding(0, at: .vertical).padding(20, at: .horizontal) }

            Section {
                Text { "COMING SOON" }
                    .font(.mono, size: 11, weight: .medium, tracking: 3, color: accentColor)

                Heading(.two) { "What to Expect" }
                    .font(.serif, size: 36, weight: .light, color: .text)

                Stack {
                    for feature in features {
                        FeatureCard(
                            icon: feature.icon,
                            title: feature.title,
                            description: feature.description,
                            accentColor: accentColor
                        )
                    }
                }
                .grid(columns: 3, gap: 24)
                .tablet { $0.grid(columns: 2, gap: 20) }
                .compact { $0.grid(columns: 1, gap: 16) }
            }
            .flex(.column, gap: 48, align: .center)
            .padding(80, at: .vertical)
            .padding(120, at: .horizontal)
            .background(.bg)
            .compact { $0.padding(60, at: .vertical).padding(20, at: .horizontal) }
        }
    }
}
