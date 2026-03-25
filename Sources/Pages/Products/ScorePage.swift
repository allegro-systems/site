import Score

struct ScorePage: Page {
    static let path = "/score"

    var body: some Node {
        Layout {
            Section {
                ProductPill(title: "Score", color: .score)

                Stack {
                    Heading(.one) { "The Swift Web Framework" }
                        .font(.serif, size: 56, weight: .light, lineHeight: 1.15, color: .text, align: .center, wrap: .balance)
                        .size(maxWidth: 740)
                        .compact { $0.font(size: 36) }
                        .animate(.fadeIn, duration: 0.6)

                    Text { "The Swift web framework" }
                        .font(.mono, size: 15, color: .muted)
                        .animate(.fadeIn, duration: 0.6, delay: 0.1)
                }
                .flex(.column, gap: 8, align: .center)

                Paragraph { "Build web applications entirely in Swift.\nResult builders for layout. Signals for state. One command to ship." }
                    .font(.mono, size: 13, lineHeight: 1.6, color: .muted, align: .center)
                    .size(maxWidth: 500)

                Stack {
                    SiteButton(title: "Read the Docs \u{2192}", link: "/docs/score", variant: .primary(.score))
                    SiteButton(title: "View on GitHub \u{2192}", link: "https://github.com/allegro-systems", variant: .secondary, opensInNewTab: true)
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
            .backgroundGradient(.radial(color: .score, opacity: 0.04, width: 120, height: 80, at: .top))
            .compact { $0.padding(80, at: .vertical).padding(20, at: .horizontal) }

            Divider()

            Section {
                Heading(.two) { "What You Get" }
                    .font(.serif, size: 32, weight: .light, color: .text)
                    .compact { $0.font(size: 28) }

                Stack {
                    FeatureCard(
                        icon: "file-text",
                        title: "Write Pages in Swift",
                        description: "Define layouts, components, and content with Swift result builders. No templates or string wrangling.",
                        accentColor: .score,
                        large: true
                    )
                    FeatureCard(
                        icon: "zap",
                        title: "Reactive UI",
                        description: "Add interactive elements with signals. State changes update the page instantly, no full reload needed.",
                        accentColor: .score,
                        large: true
                    )
                }
                .grid(columns: 2, gap: 20)
                .compact { $0.grid(columns: 1, gap: 16) }

                Stack {
                    FeatureCard(
                        icon: "palette",
                        title: "Themeable by Default",
                        description: "Set colours, fonts, spacing, and dark mode once. Every component picks them up automatically.",
                        accentColor: .score
                    )
                    FeatureCard(
                        icon: "database",
                        title: "Built-in Persistence",
                        description: "Store and query data without bolting on an ORM. Entities, migrations, and queries are part of the framework.",
                        accentColor: .score
                    )
                }
                .grid(columns: 2, gap: 20)
                .compact { $0.grid(columns: 1, gap: 16) }

                Stack {
                    FeatureCard(
                        icon: "lock",
                        title: "Auth Out of the Box",
                        description: "Add login, sessions, and route guards with a few lines. Vendor integrations handle the provider details.",
                        accentColor: .score
                    )
                    FeatureCard(
                        icon: "package",
                        title: "Ship as Static or Server",
                        description: "Generate a static site or run a live server from the same codebase. One command either way.",
                        accentColor: .score
                    )
                }
                .grid(columns: 2, gap: 20)
                .compact { $0.grid(columns: 1, gap: 16) }
            }
            .flex(.column, gap: 32)
            .padding(60, at: .vertical)
            .padding(56, at: .horizontal)
            .compact { $0.padding(40, at: .vertical).padding(20, at: .horizontal) }

            Divider()

            Section {
                Heading(.two) { "Highlights" }
                    .font(.serif, size: 32, weight: .light, color: .text)
                    .compact { $0.font(size: 28) }

                Stack {
                    Stack {
                        Heading(.three) { "Static-First Output" }
                            .font(.serif, size: 20, weight: .light, color: .text)

                        Paragraph { "Pages compile to byte-equivalent HTML + CSS by default. JS is only emitted when @State or @Action are used." }
                            .font(.mono, size: 13, lineHeight: 1.6, color: .muted)
                    }
                    .flex(.column, gap: 12)

                    Stack {
                        Heading(.three) { "Signal-Backed Reactivity" }
                            .font(.serif, size: 20, weight: .light, color: .text)

                        Paragraph { "Swift state declarations lower to TC39 Signals. Three scopes: Application (global), Page (torn down on nav), Element (per mount)." }
                            .font(.mono, size: 13, lineHeight: 1.6, color: .muted)
                    }
                    .flex(.column, gap: 12)

                    Stack {
                        Heading(.three) { "Compiler-Driven CSS" }
                            .font(.serif, size: 20, weight: .light, color: .text)

                        Paragraph { "Modifier chains compile to scoped class names. Identical modifier sets share a single class. Zero runtime style logic." }
                            .font(.mono, size: 13, lineHeight: 1.6, color: .muted)
                    }
                    .flex(.column, gap: 12)
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

            Section {
                Heading(.two) { "Example" }
                    .font(.serif, size: 32, weight: .light, color: .text)
                    .compact { $0.font(size: 28) }

                Stack {
                    Stack {
                        Text { "SOURCE" }
                            .font(.mono, size: 11, weight: .semibold, tracking: 0.05, color: .muted)

                        CodeBlock(
                            code: """
                                struct Counter: Component {
                                    @State var count = 0

                                    var body: some Node {
                                        Stack {
                                            Text { "Count: \\(count)" }
                                                .font(.title)
                                            Button("Increment") {
                                                count += 1
                                            }
                                        }
                                        .flex(.column, gap: 12)
                                    }
                                }
                                """,
                            language: "swift",
                            filename: "Counter.swift"
                        )
                    }
                    .flex(.column, gap: 8)

                    Stack {
                        Text { "OUTPUT" }
                            .font(.mono, size: 11, weight: .semibold, tracking: 0.05, color: .muted)

                        TabGroup(showsCopyButton: true) {
                            Tab("HTML", sourceText: Self.exampleHTML) {
                                CodeBlock(
                                    code: Self.exampleHTML,
                                    language: "html",
                                    showsCopyButton: false,
                                    showsHeader: false
                                )
                            }
                            Tab("CSS", sourceText: Self.exampleCSS) {
                                CodeBlock(
                                    code: Self.exampleCSS,
                                    language: "css",
                                    showsCopyButton: false,
                                    showsHeader: false
                                )
                            }
                            Tab("JS", sourceText: Self.exampleJS) {
                                CodeBlock(
                                    code: Self.exampleJS,
                                    language: "javascript",
                                    showsCopyButton: false,
                                    showsHeader: false
                                )
                            }
                            Tab("Result") {
                                Stack {
                                    Counter()
                                }
                                .flex(.column, gap: 12, align: .start)
                                .padding(24)
                            }
                        }
                    }
                    .flex(.column, gap: 8)
                }
                .grid(columns: 2, gap: 20)
                .compact { $0.grid(columns: 1, gap: 16) }
            }
            .flex(.column, gap: 32)
            .padding(60, at: .vertical)
            .padding(56, at: .horizontal)
            .compact { $0.padding(40, at: .vertical).padding(20, at: .horizontal) }

        }
    }

    // MARK: - Example Output

    private static let exampleHTML = """
        <div data-scope="Counter">
          <div class="counter-stack">
            <span data-bind="count">Count: 0</span>
            <button type="button" data-s="0">Increment</button>
          </div>
        </div>
        """

    private static let exampleCSS = """
        .counter-stack {
          display: flex;
          flex-direction: column;
          gap: 12px;
        }
        """

    private static let exampleJS = """
        const count = new Signal.State(0);

        function increment(event) {
          count.set(count.get() + 1);
        }

        document.querySelector('[data-s="0"]')
          .addEventListener("click", increment);

        Signal.effect(() => {
          document.querySelector('[data-bind="count"]')
            .textContent = count.get();
        });
        """
}
