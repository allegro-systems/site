import AllegroTheme
import Score

struct AboutPage: Page {
    static let path = "/about"

    var metadata: (any Metadata)? {
        SiteMetadata(
            title: t("meta.about.title", default: "About"),
            description: t("meta.about.description", default: "The principles and standards behind the Allegro platform.")
        )
    }

    var body: some Node {
        Layout(pagePath: Self.path) {
            Section {
                Heading(.one) { t("about.hero.title") }
                    .font(.serif, size: 56, weight: .light, lineHeight: 1.15, color: .text, align: .center, wrap: .balance)
                    .size(maxWidth: 740)
                    .compact { $0.font(size: 36) }
                    .animate(.fadeIn, duration: 0.6)

                Paragraph { t("about.hero.subtitle") }
                    .font(.mono, size: 15, lineHeight: 1.6, color: .muted, align: .center)
                    .size(maxWidth: 640)
                    .compact { $0.font(size: 14) }
                    .animate(.fadeIn, duration: 0.6, delay: 0.15)
            }
            .flex(.column, gap: 24, align: .center)
            .padding(120, at: .vertical)
            .padding(56, at: .horizontal)
            .backgroundGradient(.radial(color: .accent, opacity: 0.04, width: 120, height: 80, at: .top))
            .compact { $0.padding(80, at: .vertical).padding(20, at: .horizontal) }

            Divider()

            Section {
                SectionLabel(t("about.thesis.title"))

                Paragraph { t("about.thesis.subtitle") }
                    .font(.mono, size: 15, lineHeight: 1.6, color: .muted)

                Stack {
                    Stack {
                        AboutPrinciple(
                            title: t("about.principle.composition"),
                            description: t("about.principle.composition.desc")
                        )
                        AboutPrinciple(
                            title: t("about.principle.durability"),
                            description: t("about.principle.durability.desc")
                        )
                    }
                    .grid(columns: 2, gap: 20)
                    .compact { $0.grid(columns: 1, gap: 16) }

                    Stack {
                        AboutPrinciple(
                            title: t("about.principle.transparency"),
                            description: t("about.principle.transparency.desc")
                        )
                        AboutPrinciple(
                            title: t("about.principle.integration"),
                            description: t("about.principle.integration.desc")
                        )
                    }
                    .grid(columns: 2, gap: 20)
                    .compact { $0.grid(columns: 1, gap: 16) }

                    Stack {
                        AboutPrinciple(
                            title: t("about.principle.static"),
                            description: t("about.principle.static.desc")
                        )
                        AboutPrinciple(
                            title: t("about.principle.convention"),
                            description: t("about.principle.convention.desc")
                        )
                    }
                    .grid(columns: 2, gap: 20)
                    .compact { $0.grid(columns: 1, gap: 16) }
                }
                .flex(.column, gap: 20)
            }
            .flex(.column, gap: 48)
            .padding(80, at: .vertical)
            .padding(56, at: .horizontal)
            .compact { $0.padding(60, at: .vertical).padding(20, at: .horizontal) }

            Divider()

            Section {
                SectionLabel(t("about.standards.title"))

                Paragraph { t("about.standards.subtitle") }
                    .font(.mono, size: 15, lineHeight: 1.6, color: .muted)

                Stack {
                    Stack {
                        AboutPrinciple(
                            title: t("about.standard.feedback"),
                            description: t("about.standard.feedback.desc")
                        )
                        AboutPrinciple(
                            title: t("about.standard.floor"),
                            description: t("about.standard.floor.desc")
                        )
                    }
                    .grid(columns: 2, gap: 20)
                    .compact { $0.grid(columns: 1, gap: 16) }

                    Stack {
                        AboutPrinciple(
                            title: t("about.standard.zeroconfig"),
                            description: t("about.standard.zeroconfig.desc")
                        )
                        AboutPrinciple(
                            title: t("about.standard.docs"),
                            description: t("about.standard.docs.desc")
                        )
                    }
                    .grid(columns: 2, gap: 20)
                    .compact { $0.grid(columns: 1, gap: 16) }
                }
                .flex(.column, gap: 20)
            }
            .flex(.column, gap: 48)
            .padding(80, at: .vertical)
            .padding(56, at: .horizontal)
            .compact { $0.padding(60, at: .vertical).padding(20, at: .horizontal) }

            Section {
                SectionLabel(t("about.avoid.title"))

                Paragraph { t("about.avoid.subtitle") }
                    .font(.mono, size: 15, lineHeight: 1.6, color: .muted)

                Stack {
                    Stack {
                        AvoidItem(title: t("about.avoid.autoplay"))
                        AvoidItem(title: t("about.avoid.modal"))
                        AvoidItem(title: t("about.avoid.tooltip"))
                    }
                    .flex(.column, gap: 20)

                    Stack {
                        AvoidItem(title: t("about.avoid.deepnav"))
                        AvoidItem(title: t("about.avoid.spinners"))
                        AvoidItem(title: t("about.avoid.motion"))
                    }
                    .flex(.column, gap: 20)
                }
                .grid(columns: 2, gap: 20)
                .compact { $0.grid(columns: 1, gap: 16) }
            }
            .flex(.column, gap: 48)
            .padding(80, at: .vertical)
            .padding(56, at: .horizontal)
            .compact { $0.padding(60, at: .vertical).padding(20, at: .horizontal) }
        }
    }
}
