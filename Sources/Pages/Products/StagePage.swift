import AllegroTheme
import Score

struct StagePage: Page {
    static let path = "/stage"

    var metadata: (any Metadata)? {
        SiteMetadata(
            title: t("meta.stage.title", default: "Stage"),
            description: t("meta.stage.description", default: "Deploy and manage Swift web applications with one-command deploys, reverse proxy, and process lifecycle.")
        )
    }

    var body: some Node {
        Layout(pagePath: Self.path) {
            Section {
                ProductPill("Stage", color: .stage)

                Heading(.one) { t("stage.hero.title", default: "The Hosting Layer") }
                    .font(.serif, size: 56, weight: .light, lineHeight: 1.15, color: .text, align: .center, wrap: .balance)
                    .size(maxWidth: 740)
                    .compact { $0.font(size: 36) }
                    .animate(.fadeIn, duration: 0.6)

                Paragraph { t("stage.hero.description", default: "Deploy Score applications with a single command.\nReverse proxy, process lifecycle, idle sweeps, and billing \u{2014} built in.") }
                    .font(.mono, size: 13, lineHeight: 1.6, color: .muted, align: .center)
                    .size(maxWidth: 520)

                Stack {
                    SiteButton(title: "Get Started \u{2192}", link: "http://dashboard.allegro.localhost/login", variant: .primary(.stage))
                    SiteButton(title: "View on GitHub \u{2192}", link: "https://github.com/allegro-systems", variant: .secondary, opensInNewTab: true)
                }
                .flex(.row, gap: 16, align: .center)
                .compact { $0.flex(.column, gap: 12).size(width: .percent(100)) }
            }
            .flex(.column, gap: 24, align: .center, justify: .center)
            .size(height: 600)
            .padding(56, at: .horizontal)
            .backgroundGradient(.radial(color: .stage, opacity: 0.04, width: 120, height: 80, at: .top))
            .compact { $0.size(height: 500).padding(20, at: .horizontal) }

            Divider()

            Section {
                Heading(.two) { t("stage.features.title", default: "What You Get") }
                    .font(.serif, size: 32, weight: .light, color: .text)
                    .compact { $0.font(size: 28) }

                Stack {
                    FeatureCard(
                        icon: "rocket",
                        title: t("stage.feature.deploy.title", default: "One-Command Deploy"),
                        description: t("stage.feature.deploy.description", default: "Deploy any Score app with a single CLI command. Stage handles artifact placement, route registration, and process startup."),
                        accentColor: .stage,
                        large: true
                    )
                    FeatureCard(
                        icon: "globe",
                        title: t("stage.feature.routing.title", default: "Multi-App Routing"),
                        description: t("stage.feature.routing.description", default: "Run multiple apps on one machine with automatic domain-based routing. Each app gets its own subdomain and isolated state."),
                        accentColor: .stage,
                        large: true
                    )
                }
                .grid(columns: 2, gap: 20)
                .compact { $0.grid(columns: 1, gap: 16) }

                Stack {
                    FeatureCard(
                        icon: "activity",
                        title: t("stage.feature.lifecycle.title", default: "Process Lifecycle"),
                        description: t("stage.feature.lifecycle.description", default: "Cold-start on first request, idle sweep after timeout. Processes are managed automatically with health checks and log rotation."),
                        accentColor: .stage
                    )
                    FeatureCard(
                        icon: "shield",
                        title: t("stage.feature.proxy.title", default: "Reverse Proxy"),
                        description: t("stage.feature.proxy.description", default: "NIO-based reverse proxy serves static files directly and forwards API routes to Unix sockets. No external web server needed."),
                        accentColor: .stage
                    )
                }
                .grid(columns: 2, gap: 20)
                .compact { $0.grid(columns: 1, gap: 16) }

                Stack {
                    FeatureCard(
                        icon: "credit-card",
                        title: t("stage.feature.billing.title", default: "Built-in Billing"),
                        description: t("stage.feature.billing.description", default: "User plans, deploy limits, and build minute tracking out of the box. Integrates with Revolut for payment processing."),
                        accentColor: .stage
                    )
                    FeatureCard(
                        icon: "terminal",
                        title: t("stage.feature.dashboard.title", default: "Dashboard Included"),
                        description: t("stage.feature.dashboard.description", default: "A full Score-powered dashboard for managing apps, viewing deploys, tailing logs, and monitoring usage. No third-party tools."),
                        accentColor: .stage
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
                Heading(.two) { t("stage.highlights.title", default: "Highlights") }
                    .font(.serif, size: 32, weight: .light, color: .text)
                    .compact { $0.font(size: 28) }

                Stack {
                    Stack {
                        Heading(.three) { t("stage.highlight.static.title", default: "Static-First Serving") }
                            .font(.serif, size: 20, weight: .light, color: .text)

                        Paragraph { t("stage.highlight.static.description", default: "The reverse proxy tries static files before proxying to the app server. Pages load instantly from disk. Only API routes hit the backend.") }
                            .font(.mono, size: 13, lineHeight: 1.6, color: .muted)
                    }
                    .flex(.column, gap: 12)

                    Stack {
                        Heading(.three) { t("stage.highlight.lifecycle.title", default: "Process Lifecycle") }
                            .font(.serif, size: 20, weight: .light, color: .text)

                        Paragraph {
                            t("stage.highlight.lifecycle.description", default: "Stage manages your app processes end to end. Automatic restarts on crash, idle shutdown, and structured logging — no containers or orchestration required.")
                        }
                        .font(.mono, size: 13, lineHeight: 1.6, color: .muted)
                    }
                    .flex(.column, gap: 12)

                    Stack {
                        Heading(.three) { t("stage.highlight.environments.title", default: "Reproducible Environments") }
                            .font(.serif, size: 20, weight: .light, color: .text)

                        Paragraph { t("stage.highlight.environments.description", default: "Define your deployment target declaratively. Clone the config, run setup, and the full environment comes up — same every time.") }
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
                Heading(.two) { t("stage.deploy.title", default: "Deploy in Seconds") }
                    .font(.serif, size: 32, weight: .light, color: .text)
                    .compact { $0.font(size: 28) }

                Stack {
                    Stack {
                        Text { t("stage.deploy.build", default: "BUILD") }
                            .font(.mono, size: 11, weight: .semibold, tracking: 0.05, color: .muted)

                        CodeBlock(
                            code: """
                                swift build -c release
                                """,
                            language: "swift",
                            filename: "Terminal"
                        )
                    }
                    .flex(.column, gap: 8)

                    Stack {
                        Text { t("stage.deploy.deploy", default: "DEPLOY") }
                            .font(.mono, size: 11, weight: .semibold, tracking: 0.05, color: .muted)

                        CodeBlock(
                            code: """
                                stage-manager deploy \\
                                    --artifact .score \\
                                    --kind score \\
                                    --domains myapp.allegro.dev \\
                                    allegro myapp
                                """,
                            language: "swift",
                            filename: "Terminal"
                        )
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
}
