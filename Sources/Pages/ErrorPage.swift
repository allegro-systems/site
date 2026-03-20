import Score

struct NotFoundPage: ErrorPage {
    var context: ErrorContext

    var body: some Node {
        Layout {
            Section {
                Text { Localized("error.404") }
                    .font(.serif, size: 120, weight: .light, color: .dimmer)
                    .compact { $0.font(size: 96) }

                Heading(.one) { Localized("error.title") }
                    .font(.serif, size: 36, weight: .light, color: .text)
                    .compact { $0.font(size: 30) }

                Paragraph { Localized("error.message") }
                    .font(.mono, size: 14, lineHeight: 1.6, color: .muted, align: .center)
                    .size(maxWidth: 400)
                    .compact { $0.font(size: 13) }

                SiteButton(title: t("ui.back_to_home"), link: "/", variant: .secondary)
            }
            .flex(.column, gap: 24, align: .center, justify: .center)
            .size(minHeight: 600)
            .backgroundGradient(.radial(color: .accent, opacity: 0.04, width: 100, height: 100, at: .center))
        }
    }
}
