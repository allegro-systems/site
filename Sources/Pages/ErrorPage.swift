import Score

struct NotFoundPage: Page {
    static let path = "/404"

    var body: some Node {
        Layout {
            Section {
                Text { "404" }
                    .font(.serif, size: 120, weight: .light, color: .custom("dimmer", shade: 500))
                    .compact { $0.font(size: 96) }

                Heading(.one) { "Page not found" }
                    .font(.serif, size: 36, weight: .light, color: .text)
                    .compact { $0.font(size: 30) }

                Paragraph { "The page you\u{2019}re looking for doesn\u{2019}t exist\nor has been moved." }
                    .font(.mono, size: 14, lineHeight: 1.6, color: .muted, align: .center)
                    .size(maxWidth: 400)
                    .compact { $0.font(size: 13) }

                SiteButton(title: "\u{2190} Back to Home", link: "/", variant: .secondary)
            }
            .flex(.column, gap: 24, align: .center, justify: .center)
            .size(minHeight: 600)
            .backgroundGradient(.radial(color: .accent, opacity: 0.04, width: 100, height: 100, at: .center))

            HorizontalRule()
                .background(.border)
                .size(height: 1)
                .border(width: 0, color: .border, style: .none)
        }
    }
}
