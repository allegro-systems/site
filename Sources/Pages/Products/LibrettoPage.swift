import Score

struct LibrettoPage: Page {
    static let path = "/libretto"

    var body: some Node {
        Layout {
            Section {
                ProductPill(title: "Libretto", color: .libretto)

                Stack {
                    Heading(.one) { "A Platform\nfor Writers" }
                        .font(.serif, size: 56, weight: .light, lineHeight: 1.15, color: .text, align: .center, wrap: .balance)
                        .size(maxWidth: 740)
                        .compact { $0.font(size: 36) }
                        .animate(.fadeIn, duration: 0.6)

                    Text { "Write, publish, and grow your audience" }
                        .font(.mono, size: 15, color: .muted)
                        .animate(.fadeIn, duration: 0.6, delay: 0.1)
                }
                .flex(.column, gap: 8, align: .center)

                Paragraph { "A writing and publishing platform built on Score.\nMarkdown editor, profiles, likes, comments, and Pro billing." }
                    .font(.mono, size: 13, lineHeight: 1.6, color: .muted, align: .center)
                    .size(maxWidth: 520)

                Stack {
                    SiteButton(title: "Get Started \u{2192}", link: "http://libretto.allegro.localhost/login", variant: .primary(.libretto))
                    SiteButton(title: "Read the Blog \u{2192}", link: "http://libretto.allegro.localhost/blog", variant: .secondary)
                }
                .flex(.row, gap: 16, align: .center)
                .compact { $0.flex(.column, gap: 12).size(width: .percent(100)) }
            }
            .flex(.column, gap: 24, align: .center, justify: .center)
            .size(height: 600)
            .padding(80, at: .vertical)
            .padding(56, at: .horizontal)
            .backgroundGradient(.radial(color: .libretto, opacity: 0.04, width: 120, height: 80, at: .top))
            .compact { $0.padding(80, at: .vertical).padding(20, at: .horizontal) }

            Divider()

            Section {
                Heading(.two) { "What You Get" }
                    .font(.serif, size: 32, weight: .light, color: .text)
                    .compact { $0.font(size: 28) }

                Stack {
                    FeatureCard(
                        icon: "edit-3",
                        title: "Markdown Editor",
                        description: "A dual-mode editor with formatting toolbar, live preview, and auto-save. Write in Markdown with toolbar shortcuts for bold, italic, headings, links, and code.",
                        accentColor: .libretto,
                        large: true
                    )
                    FeatureCard(
                        icon: "book-open",
                        title: "Public Blog",
                        description: "Published posts get their own URL, read-time estimates, and RSS feed. The blog page lists all published work with excerpts and author links.",
                        accentColor: .libretto,
                        large: true
                    )
                }
                .grid(columns: 2, gap: 20)
                .compact { $0.grid(columns: 1, gap: 16) }

                Stack {
                    FeatureCard(
                        icon: "user",
                        title: "Author Profiles",
                        description: "Each writer gets a public profile with avatar, bio, social links, and a feed of their published posts.",
                        accentColor: .libretto
                    )
                    FeatureCard(
                        icon: "heart",
                        title: "Likes and Comments",
                        description: "Readers can like posts and leave comments. Counts are denormalized for fast rendering on listing pages.",
                        accentColor: .libretto
                    )
                }
                .grid(columns: 2, gap: 20)
                .compact { $0.grid(columns: 1, gap: 16) }

                Stack {
                    FeatureCard(
                        icon: "lock",
                        title: "Magic Link Auth",
                        description: "Sign in with email magic links, passkeys, or GitHub OAuth. No passwords to manage. Sessions are cookie-based and HTTP-only.",
                        accentColor: .libretto
                    )
                    FeatureCard(
                        icon: "credit-card",
                        title: "Pro Plan",
                        description: "Upgrade to Pro for extended features. Billing is handled through Revolut with checkout pages built into the app.",
                        accentColor: .libretto
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
                        Heading(.three) { "Pure Score App" }
                            .font(.serif, size: 20, weight: .light, color: .text)

                        Paragraph { "Libretto is a standard Score application with controllers and pages. No special runtime. The same framework that renders the marketing site powers the writing platform." }
                            .font(.mono, size: 13, lineHeight: 1.6, color: .muted)
                    }
                    .flex(.column, gap: 12)

                    Stack {
                        Heading(.three) { "ScoreData Persistence" }
                            .font(.serif, size: 20, weight: .light, color: .text)

                        Paragraph { "All data is stored through ScoreData \u{2014} a pluggable persistence layer with SQLite as the default backend. The KVStore API uses hierarchical keys and typed wrappers, but the backend is swappable." }
                            .font(.mono, size: 13, lineHeight: 1.6, color: .muted)
                    }
                    .flex(.column, gap: 12)

                    Stack {
                        Heading(.three) { "RSS Built In" }
                            .font(.serif, size: 20, weight: .light, color: .text)

                        Paragraph { "Every Libretto instance serves an RSS feed at /feed. Subscribe in any reader to follow new posts without an account." }
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
                Heading(.two) { "Built on the Allegro Stack" }
                    .font(.serif, size: 32, weight: .light, color: .text)
                    .compact { $0.font(size: 28) }

                Stack {
                    Stack {
                        Text { "FRAMEWORK" }
                            .font(.mono, size: 11, weight: .semibold, tracking: 0.05, color: .score)
                        Paragraph { "Score renders pages and handles API routes. The same DSL used for the marketing site builds the editor, blog, and profile pages." }
                            .font(.mono, size: 13, lineHeight: 1.6, color: .muted)
                    }
                    .flex(.column, gap: 8)

                    Stack {
                        Text { "HOSTING" }
                            .font(.mono, size: 11, weight: .semibold, tracking: 0.05, color: .stage)
                        Paragraph { "Stage deploys the binary and static files, manages the process lifecycle, and routes requests through its reverse proxy." }
                            .font(.mono, size: 13, lineHeight: 1.6, color: .muted)
                    }
                    .flex(.column, gap: 8)

                    Stack {
                        Text { "AUTH" }
                            .font(.mono, size: 11, weight: .semibold, tracking: 0.05, color: .libretto)
                        Paragraph { "ScoreAuth provides magic links, passkeys, and session management. ScoreOAuth adds GitHub login. No external auth service." }
                            .font(.mono, size: 13, lineHeight: 1.6, color: .muted)
                    }
                    .flex(.column, gap: 8)
                }
                .grid(columns: 3, gap: 32)
                .tablet { $0.grid(columns: 2, gap: 20) }
                .compact { $0.grid(columns: 1, gap: 24) }
            }
            .flex(.column, gap: 32)
            .padding(60, at: .vertical)
            .padding(56, at: .horizontal)
            .compact { $0.padding(40, at: .vertical).padding(20, at: .horizontal) }
        }
    }
}
