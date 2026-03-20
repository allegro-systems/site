import Score

struct AboutPage: Page {
    static let path = "/about"

    var body: some Node {
        Layout {
            Section {
                Heading(.one) { "Our Philosophy" }
                    .font(.serif, size: 56, weight: .light, lineHeight: 1.15, color: .text, align: .center, wrap: .balance)
                    .size(maxWidth: 740)
                    .compact { $0.font(size: 36) }
                    .animate(.fadeIn, duration: 0.6)

                Paragraph { "We build tools for the long-term web \u{2014} software that respects the craft of development and the patience of good design." }
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
                SectionLabel(title: "Systems Thesis")

                Paragraph { "Six principles that guide every architectural decision we make." }
                    .font(.mono, size: 15, lineHeight: 1.6, color: .muted)

                Stack {
                    Stack {
                        AboutPrinciple(
                            title: "Composition over inheritance",
                            description: "Build complex behavior from small, predictable parts rather than deep class hierarchies."
                        )
                        AboutPrinciple(
                            title: "Durability over novelty",
                            description: "Choose boring technology that works reliably over shiny tools that may not last."
                        )
                    }
                    .grid(columns: 2, gap: 20)
                    .compact { $0.grid(columns: 1, gap: 16) }

                    Stack {
                        AboutPrinciple(
                            title: "Transparency over magic",
                            description: "Every abstraction should be inspectable. No hidden runtime behavior."
                        )
                        AboutPrinciple(
                            title: "Vertical integration over glue",
                            description: "Own the full stack from source to deployment. Fewer seams, fewer bugs."
                        )
                    }
                    .grid(columns: 2, gap: 20)
                    .compact { $0.grid(columns: 1, gap: 16) }

                    Stack {
                        AboutPrinciple(
                            title: "Static analysis over runtime checks",
                            description: "Catch errors at compile time. Type safety is the first line of defense."
                        )
                        AboutPrinciple(
                            title: "Convention over configuration",
                            description: "Sensible defaults that cover 90% of cases. Escape hatches for the rest."
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
                SectionLabel(title: "Product Standards")

                Paragraph { "How we think about the experience layer \u{2014} the interface between tool and human." }
                    .font(.mono, size: 15, lineHeight: 1.6, color: .muted)

                Stack {
                    Stack {
                        AboutPrinciple(
                            title: "Immediate feedback",
                            description: "Every action should produce a visible result within milliseconds."
                        )
                        AboutPrinciple(
                            title: "Low floor, high ceiling",
                            description: "Easy to start, powerful enough for production. No training wheels that get in the way."
                        )
                    }
                    .grid(columns: 2, gap: 20)
                    .compact { $0.grid(columns: 1, gap: 16) }

                    Stack {
                        AboutPrinciple(
                            title: "Zero config by default",
                            description: "Ship with sensible defaults. Configuration is for overrides, not setup."
                        )
                        AboutPrinciple(
                            title: "Docs are product",
                            description: "Documentation is not an afterthought. It ships with the feature."
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
                SectionLabel(title: "What We Avoid")

                Paragraph { "Patterns we consciously reject. Not because they\u{2019}re always wrong,\nbut because they conflict with the experience we\u{2019}re building." }
                    .font(.mono, size: 15, lineHeight: 1.6, color: .muted)

                Stack {
                    Stack {
                        AvoidItem(title: "Unsolicited autoplay")
                        AvoidItem(title: "Modal interruptions")
                        AvoidItem(title: "Tooltip dependency")
                    }
                    .flex(.column, gap: 20)

                    Stack {
                        AvoidItem(title: "Deep navigation")
                        AvoidItem(title: "Loading spinners")
                        AvoidItem(title: "Excessive decorative motion")
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
