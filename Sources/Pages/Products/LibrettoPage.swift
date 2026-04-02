import AllegroTheme
import Score

struct LibrettoPage: Page {
    static let path = "/libretto"

    var metadata: (any Metadata)? {
        SiteMetadata(
            title: t("meta.libretto.title", default: "Libretto"),
            description: t("meta.libretto.description", default: "A writing and publishing platform built on Score with Markdown editing, profiles, and Pro billing.")
        )
    }

    var body: some Node {
        Layout(pagePath: Self.path) {
            Section {
                ProductPill("Libretto", color: .libretto)

                Heading(.one) { t("libretto.hero.title", default: "A Platform\nfor Writers") }
                    .font(.serif, size: 56, weight: .light, lineHeight: 1.15, color: .text, align: .center, wrap: .balance)
                    .size(maxWidth: 740)
                    .compact { $0.font(size: 36) }
                    .animate(.fadeIn, duration: 0.6)

                Paragraph { t("libretto.hero.description", default: "A writing and publishing platform built on Score.\nMarkdown editor, profiles, likes, comments, and Pro billing.") }
                    .font(.mono, size: 13, lineHeight: 1.6, color: .muted, align: .center)
                    .size(maxWidth: 520)

                Stack {
                    SiteButton(title: "Get Started \u{2192}", link: "https://libretto.allegro.systems/login", variant: .primary(.libretto))
                    SiteButton(title: "Read the Blog \u{2192}", link: "https://libretto.allegro.systems/blog", variant: .secondary)
                }
                .flex(.row, gap: 16, align: .center)
                .compact { $0.flex(.column, gap: 12).size(width: .percent(100)) }
            }
            .flex(.column, gap: 24, align: .center, justify: .center)
            .size(height: 600)
            .padding(56, at: .horizontal)
            .backgroundGradient(.radial(color: .libretto, opacity: 0.04, width: 120, height: 80, at: .top))
            .compact { $0.size(height: 500).padding(20, at: .horizontal) }

            Divider()

            Section {
                Heading(.two) { t("libretto.features.title", default: "What You Get") }
                    .font(.serif, size: 32, weight: .light, color: .text)
                    .compact { $0.font(size: 28) }

                Stack {
                    FeatureCard(
                        icon: "edit-3",
                        title: t("libretto.feature.editor.title", default: "Markdown Editor"),
                        description:
                            t("libretto.feature.editor.description", default: "A dual-mode editor with formatting toolbar, live preview, and auto-save. Write in Markdown with toolbar shortcuts for bold, italic, headings, links, and code."),
                        accentColor: .libretto,
                        large: true
                    )
                    FeatureCard(
                        icon: "book-open",
                        title: t("libretto.feature.blog.title", default: "Public Blog"),
                        description: t("libretto.feature.blog.description", default: "Published posts get their own URL, read-time estimates, and RSS feed. The blog page lists all published work with excerpts and author links."),
                        accentColor: .libretto,
                        large: true
                    )
                }
                .grid(columns: 2, gap: 20)
                .compact { $0.grid(columns: 1, gap: 16) }

                Stack {
                    FeatureCard(
                        icon: "user",
                        title: t("libretto.feature.profiles.title", default: "Author Profiles"),
                        description: t("libretto.feature.profiles.description", default: "Each writer gets a public profile with avatar, bio, social links, and a feed of their published posts."),
                        accentColor: .libretto
                    )
                    FeatureCard(
                        icon: "heart",
                        title: t("libretto.feature.social.title", default: "Likes and Comments"),
                        description: t("libretto.feature.social.description", default: "Readers can like posts and leave comments. Counts are denormalized for fast rendering on listing pages."),
                        accentColor: .libretto
                    )
                }
                .grid(columns: 2, gap: 20)
                .compact { $0.grid(columns: 1, gap: 16) }

                Stack {
                    FeatureCard(
                        icon: "lock",
                        title: t("libretto.feature.auth.title", default: "Magic Link Auth"),
                        description: t("libretto.feature.auth.description", default: "Sign in with email magic links, passkeys, or GitHub OAuth. No passwords to manage. Sessions are cookie-based and HTTP-only."),
                        accentColor: .libretto
                    )
                    FeatureCard(
                        icon: "credit-card",
                        title: t("libretto.feature.pro.title", default: "Pro Plan"),
                        description: t("libretto.feature.pro.description", default: "Upgrade to Pro for extended features. Billing is handled through Revolut with checkout pages built into the app."),
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
                Heading(.two) { t("libretto.highlights.title", default: "Highlights") }
                    .font(.serif, size: 32, weight: .light, color: .text)
                    .compact { $0.font(size: 28) }

                Stack {
                    Stack {
                        Heading(.three) { t("libretto.highlight.score_app.title", default: "Pure Score App") }
                            .font(.serif, size: 20, weight: .light, color: .text)

                        Paragraph {
                            t("libretto.highlight.score_app.description", default: "Libretto is a standard Score application with controllers and pages. No special runtime. The same framework that renders the marketing site powers the writing platform.")
                        }
                        .font(.mono, size: 13, lineHeight: 1.6, color: .muted)
                    }
                    .flex(.column, gap: 12)

                    Stack {
                        Heading(.three) { t("libretto.highlight.persistence.title", default: "ScoreData Persistence") }
                            .font(.serif, size: 20, weight: .light, color: .text)

                        Paragraph {
                            t("libretto.highlight.persistence.description", default: "All data is stored through ScoreData \u{2014} a pluggable persistence layer with SQLite as the default backend. The KVStore API uses hierarchical keys and typed wrappers, but the backend is swappable.")
                        }
                        .font(.mono, size: 13, lineHeight: 1.6, color: .muted)
                    }
                    .flex(.column, gap: 12)

                    Stack {
                        Heading(.three) { t("libretto.highlight.rss.title", default: "RSS Built In") }
                            .font(.serif, size: 20, weight: .light, color: .text)

                        Paragraph { t("libretto.highlight.rss.description", default: "Every Libretto instance serves an RSS feed at /feed. Subscribe in any reader to follow new posts without an account.") }
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
                Heading(.two) { t("libretto.stack.title", default: "Built on the Allegro Stack") }
                    .font(.serif, size: 32, weight: .light, color: .text)
                    .compact { $0.font(size: 28) }

                Stack {
                    Stack {
                        Text { t("libretto.stack.framework.label", default: "FRAMEWORK") }
                            .font(.mono, size: 11, weight: .semibold, tracking: 0.05, color: .score)
                        Paragraph { t("libretto.stack.framework.description", default: "Score renders pages and handles API routes. The same DSL used for the marketing site builds the editor, blog, and profile pages.") }
                            .font(.mono, size: 13, lineHeight: 1.6, color: .muted)
                    }
                    .flex(.column, gap: 8)

                    Stack {
                        Text { t("libretto.stack.hosting.label", default: "HOSTING") }
                            .font(.mono, size: 11, weight: .semibold, tracking: 0.05, color: .stage)
                        Paragraph { t("libretto.stack.hosting.description", default: "Stage deploys the binary and static files, manages the process lifecycle, and routes requests through its reverse proxy.") }
                            .font(.mono, size: 13, lineHeight: 1.6, color: .muted)
                    }
                    .flex(.column, gap: 8)

                    Stack {
                        Text { t("libretto.stack.auth.label", default: "AUTH") }
                            .font(.mono, size: 11, weight: .semibold, tracking: 0.05, color: .libretto)
                        Paragraph { t("libretto.stack.auth.description", default: "ScoreAuth provides magic links, passkeys, and session management. ScoreOAuth adds GitHub login. No external auth service.") }
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
