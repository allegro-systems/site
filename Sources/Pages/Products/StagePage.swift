import Score

struct StagePage: Page {
    static let path = "/stage"

    var body: some Node {
        Layout {
            Section {
                ProductPill(title: "Stage", color: .stage)

                Stack {
                    Heading(.one) { "The Hosting and\nOperations Layer" }
                        .font(.serif, size: 56, weight: .light, lineHeight: 1.15, color: .text, align: .center, wrap: .balance)
                        .size(maxWidth: 740)
                        .compact { $0.font(size: 36) }
                        .animate(.fadeIn, duration: 0.6)

                    Text { "The hosting and operations layer" }
                        .font(.mono, size: 15, color: .muted)
                        .animate(.fadeIn, duration: 0.6, delay: 0.1)
                }
                .flex(.column, gap: 8, align: .center)

                Paragraph { "Deploy Score applications with a single command.\nReverse proxy, process lifecycle, idle sweeps, and billing \u{2014} built in." }
                    .font(.mono, size: 13, lineHeight: 1.6, color: .muted, align: .center)
                    .size(maxWidth: 520)

                Stack {
                    SiteButton(title: "Open Dashboard \u{2192}", link: "http://dashboard.allegro.localhost", variant: .primary(.stage))
                    SiteButton(title: "View on GitHub \u{2192}", link: "https://github.com/allegro-systems", variant: .secondary, opensInNewTab: true)
                }
                .flex(.row, gap: 16, align: .center)
                .compact { $0.flex(.column, gap: 12).size(width: .percent(100)) }
            }
            .flex(.column, gap: 24, align: .center)
            .padding(100, at: .vertical)
            .padding(56, at: .horizontal)
            .backgroundGradient(.radial(color: .stage, opacity: 0.04, width: 120, height: 80, at: .top))
            .compact { $0.padding(80, at: .vertical).padding(20, at: .horizontal) }

            Divider()

            Section {
                Heading(.two) { "What You Get" }
                    .font(.serif, size: 32, weight: .light, color: .text)
                    .compact { $0.font(size: 28) }

                Stack {
                    FeatureCard(
                        icon: "rocket",
                        title: "One-Command Deploy",
                        description: "Deploy any Score app with a single CLI command. Stage handles artifact placement, route registration, and process startup.",
                        accentColor: .stage,
                        large: true
                    )
                    FeatureCard(
                        icon: "globe",
                        title: "Multi-App Routing",
                        description: "Run multiple apps on one machine with automatic domain-based routing. Each app gets its own subdomain and isolated state.",
                        accentColor: .stage,
                        large: true
                    )
                }
                .grid(columns: 2, gap: 20)
                .compact { $0.grid(columns: 1, gap: 16) }

                Stack {
                    FeatureCard(
                        icon: "activity",
                        title: "Process Lifecycle",
                        description: "Cold-start on first request, idle sweep after timeout. Processes are managed automatically with health checks and log rotation.",
                        accentColor: .stage
                    )
                    FeatureCard(
                        icon: "shield",
                        title: "Reverse Proxy",
                        description: "NIO-based reverse proxy serves static files directly and forwards API routes to Unix sockets. No external web server needed.",
                        accentColor: .stage
                    )
                }
                .grid(columns: 2, gap: 20)
                .compact { $0.grid(columns: 1, gap: 16) }

                Stack {
                    FeatureCard(
                        icon: "credit-card",
                        title: "Built-in Billing",
                        description: "User plans, deploy limits, and build minute tracking out of the box. Integrates with Revolut for payment processing.",
                        accentColor: .stage
                    )
                    FeatureCard(
                        icon: "terminal",
                        title: "Dashboard Included",
                        description: "A full Score-powered dashboard for managing apps, viewing deploys, tailing logs, and monitoring usage. No third-party tools.",
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
                Heading(.two) { "Highlights" }
                    .font(.serif, size: 32, weight: .light, color: .text)
                    .compact { $0.font(size: 28) }

                Stack {
                    Stack {
                        Heading(.three) { "Static-First Serving" }
                            .font(.serif, size: 20, weight: .light, color: .text)

                        Paragraph { "The reverse proxy tries static files before proxying to the app server. Pages load instantly from disk. Only API routes hit the backend." }
                            .font(.mono, size: 13, lineHeight: 1.6, color: .muted)
                    }
                    .flex(.column, gap: 12)

                    Stack {
                        Heading(.three) { "launchd-Native" }
                            .font(.serif, size: 20, weight: .light, color: .text)

                        Paragraph { "Stage runs as a macOS launch agent. Survives crashes, starts on login, and writes structured logs to disk. No containers, no orchestration." }
                            .font(.mono, size: 13, lineHeight: 1.6, color: .muted)
                    }
                    .flex(.column, gap: 12)

                    Stack {
                        Heading(.three) { "Git-Reproducible State" }
                            .font(.serif, size: 20, weight: .light, color: .text)

                        Paragraph { "The server repo tracks mise tasks, launchd plists, and tunnel config. Clone, run setup, and the whole environment comes up." }
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
                Heading(.two) { "Deploy in Seconds" }
                    .font(.serif, size: 32, weight: .light, color: .text)
                    .compact { $0.font(size: 28) }

                Stack {
                    Stack {
                        Text { "BUILD" }
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
                        Text { "DEPLOY" }
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
