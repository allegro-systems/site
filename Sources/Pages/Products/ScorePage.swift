import AllegroTheme
import Score

struct ScorePage: Page {
    static let path = "/score"

    var metadata: (any Metadata)? {
        SiteMetadata(
            title: t("meta.score.title", default: "Score"),
            description: t("meta.score.description", default: "A server-rendered Swift web framework with reactive signals and zero-JS-by-default output.")
        )
    }

    var body: some Node {
        Layout(pagePath: Self.path) {
            Section {
                ProductPill("Score", color: .score)

                Heading(.one) { t("score.hero.title", default: "The Swift Web Framework") }
                    .font(.serif, size: 56, weight: .light, lineHeight: 1.15, color: .text, align: .center, wrap: .balance)
                    .size(maxWidth: 740)
                    .compact { $0.font(size: 36) }
                    .animate(.fadeIn, duration: 0.6)

                Paragraph { t("score.hero.description", default: "Build web applications entirely in Swift.\nResult builders for layout. Signals for state. One command to ship.") }
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
            .padding(56, at: .horizontal)
            .backgroundGradient(.radial(color: .score, opacity: 0.04, width: 120, height: 80, at: .top))
            .compact { $0.size(height: 500).padding(20, at: .horizontal) }

            Divider()

            Section {
                Heading(.two) { t("score.features.title", default: "What You Get") }
                    .font(.serif, size: 32, weight: .light, color: .text)
                    .compact { $0.font(size: 28) }

                Stack {
                    FeatureCard(
                        icon: "file-text",
                        title: t("score.feature.pages.title", default: "Write Pages in Swift"),
                        description: t("score.feature.pages.description", default: "Define layouts, components, and content with Swift result builders. No templates or string wrangling."),
                        accentColor: .score,
                        large: true
                    )
                    FeatureCard(
                        icon: "zap",
                        title: t("score.feature.reactive.title", default: "Reactive UI"),
                        description: t("score.feature.reactive.description", default: "Add interactive elements with signals. State changes update the page instantly, no full reload needed."),
                        accentColor: .score,
                        large: true
                    )
                }
                .grid(columns: 2, gap: 20)
                .compact { $0.grid(columns: 1, gap: 16) }

                Stack {
                    FeatureCard(
                        icon: "palette",
                        title: t("score.feature.theme.title", default: "Themeable by Default"),
                        description: t("score.feature.theme.description", default: "Set colours, fonts, spacing, and dark mode once. Every component picks them up automatically."),
                        accentColor: .score
                    )
                    FeatureCard(
                        icon: "database",
                        title: t("score.feature.persistence.title", default: "Built-in Persistence"),
                        description: t("score.feature.persistence.description", default: "Store and query data without bolting on an ORM. Entities, migrations, and queries are part of the framework."),
                        accentColor: .score
                    )
                }
                .grid(columns: 2, gap: 20)
                .compact { $0.grid(columns: 1, gap: 16) }

                Stack {
                    FeatureCard(
                        icon: "lock",
                        title: t("score.feature.auth.title", default: "Auth Out of the Box"),
                        description: t("score.feature.auth.description", default: "Add login, sessions, and route guards with a few lines. Vendor integrations handle the provider details."),
                        accentColor: .score
                    )
                    FeatureCard(
                        icon: "package",
                        title: t("score.feature.deploy.title", default: "Ship as Static or Server"),
                        description: t("score.feature.deploy.description", default: "Generate a static site or run a live server from the same codebase. One command either way."),
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
                Heading(.two) { t("score.highlights.title", default: "Highlights") }
                    .font(.serif, size: 32, weight: .light, color: .text)
                    .compact { $0.font(size: 28) }

                Stack {
                    Stack {
                        Heading(.three) { t("score.highlight.static.title", default: "Static-First Output") }
                            .font(.serif, size: 20, weight: .light, color: .text)

                        Paragraph { t("score.highlight.static.description", default: "Pages compile to byte-equivalent HTML + CSS by default. JS is only emitted when @State or @Action are used.") }
                            .font(.mono, size: 13, lineHeight: 1.6, color: .muted)
                    }
                    .flex(.column, gap: 12)

                    Stack {
                        Heading(.three) { t("score.highlight.signals.title", default: "Signal-Backed Reactivity") }
                            .font(.serif, size: 20, weight: .light, color: .text)

                        Paragraph { t("score.highlight.signals.description", default: "Swift state declarations lower to TC39 Signals. Three scopes: Application (global), Page (torn down on nav), Element (per mount).") }
                            .font(.mono, size: 13, lineHeight: 1.6, color: .muted)
                    }
                    .flex(.column, gap: 12)

                    Stack {
                        Heading(.three) { t("score.highlight.css.title", default: "Compiler-Driven CSS") }
                            .font(.serif, size: 20, weight: .light, color: .text)

                        Paragraph { t("score.highlight.css.description", default: "Modifier chains compile to scoped class names. Identical modifier sets share a single class. Zero runtime style logic.") }
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
                Heading(.two) { t("score.example.title", default: "Example") }
                    .font(.serif, size: 32, weight: .light, color: .text)
                    .compact { $0.font(size: 28) }

                Stack {
                    Stack {
                        Text { t("score.example.source", default: "SOURCE") }
                            .font(.mono, size: 11, weight: .semibold, tracking: 0.05, color: .muted)

                        CodeBlock(
                            code: Self.exampleSwift,
                            language: "swift",
                            filename: "Counter.swift"
                        )
                    }
                    .flex(.column, gap: 8)

                    Stack {
                        Text { t("score.example.output", default: "OUTPUT") }
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
                                .background(.surface)
                            }
                        }

                        Paragraph { t("score.example.note", default: "All production output is minified and fingerprinted on build.") }
                            .font(.mono, size: 11, color: .muted)
                            .padding(8, at: .horizontal)
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

    // MARK: - Example Blocks

    private static let exampleSwift = """
    @Component
    struct Counter {

        @State var count = 0

        @Action
        mutating func increment() {
            count += 1
        }

        var body: some Node {

            Stack {
                Text { "Count:" }
                    .font(.serif, size: 20, weight: .light, color: .text)
                $count
            }
            .flex(.row, gap: 6, align: .baseline)

            Button {
                Text { "Increment" }
                    .font(.mono, size: 13, weight: .medium, color: .score)
            }
            .on(.click, action: "increment")
            .padding(8, at: .vertical)
            .padding(16, at: .horizontal)
            .border(width: 1, color: .score, style: .solid, radius: 6)
            .cursor(.pointer)
        }
    }
    """

    private static let exampleHTML = """
    <div class="counter-row">
      <div class="counter-row-2">Count:</div>
      <span data-bind="count">0</span>
    </div>
    <button type="button"
      data-action="counter:increment">
      <div class="counter-row-3">Increment</div>
    </button>
    """

    private static let exampleCSS = """
    .counter {
      .counter-row {
        display: flex;
        flex-direction: row;
        align-items: baseline;
        gap: 6px;
      }
      .counter-row-2 {
        font-family: var(--font-serif);
        font-size: 20px;
        font-weight: 300;
        color: var(--color-text);
      }
      button {
        cursor: pointer;
        border: 1px solid var(--color-score);
        border-radius: 6px;
        padding-inline: 16px;
        padding-block: 8px;
      }
      .counter-row-3 {
        font-family: var(--font-mono);
        font-size: 13px;
        font-weight: 500;
        color: var(--color-score);
      }
    }
    """

    private static let exampleJS = """
    // State
    const count = new Signal.State(0);

    // Actions
    function increment(event) {
      count.set(count.get() + 1);
    }

    // Event bindings
    document
      .querySelectorAll('[data-action="counter:increment"]')
      .forEach(el => el.addEventListener("click", increment));

    // Reactive DOM updates
    Signal.effect(() => {
      document.querySelector('[data-bind="count"]')
        .textContent = count.get();
    });
    """
}
