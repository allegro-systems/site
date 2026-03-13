import Score

struct BlogPage: Page {
    static let path = "/blog"

    var body: some Node {
        Layout {
            Section {
                Heading(.one) { "Blog" }
                    .font(.serif, size: 48, weight: .medium, lineHeight: 1.05, color: .text, align: .center, wrap: .balance)
                    .compact { $0.font(size: 36) }

                Paragraph { "Architectural notes, design decisions, and build updates." }
                    .font(.mono, size: 14, color: .muted, align: .center)
                    .compact { $0.font(size: 13) }
            }
            .flex(.column, gap: 16, align: .center)
            .padding(80, at: .top)
            .padding(60, at: .bottom)
            .padding(56, at: .horizontal)
            .backgroundGradient(.radial(color: .accent, opacity: 0.04, width: 120, height: 100, at: .center))
            .compact { $0.flex(.column, gap: 12, align: .center).padding(60, at: .top).padding(20, at: .bottom).padding(20, at: .horizontal) }

            Stack {
                Text { "All" }
                    .font(.mono, size: 13, weight: .medium, color: .accent)
                    .padding(4, at: .vertical)
                    .padding(12, at: .horizontal)
                    .background(.elevated)
                    .radius(3)
                Text { "Architecture" }
                    .font(.mono, size: 13, color: .muted)
                Text { "Design" }
                    .font(.mono, size: 13, color: .muted)
                Text { "Engineering" }
                    .font(.mono, size: 13, color: .muted)
                Text { "Infrastructure" }
                    .font(.mono, size: 13, color: .muted)
            }
            .flex(.row, gap: 12, align: .center)
            .padding(24, at: .vertical)
            .padding(56, at: .horizontal)
            .compact { $0.padding(16, at: .vertical).padding(20, at: .horizontal).flex(.row, gap: 12, align: .center, wraps: true) }

            Stack {
                BlogPostEntry(
                    category: "Architecture",
                    date: "2026 \u{00B7} 03 \u{00B7} 08",
                    title: "Why Static-First Delivery Matters",
                    excerpt:
                        "A look at how pre-rendered pages reduce latency, simplify infrastructure, and keep the bundle lean \u{2014} without sacrificing interactivity where it counts."
                )
                BlogPostEntry(
                    category: "Design",
                    date: "2026 \u{00B7} 02 \u{00B7} 21",
                    title: "Designing Score: A Swift DSL for the Web",
                    excerpt: "The motivations behind building a declarative Swift DSL for generating semantic HTML \u{2014} and the tradeoffs we made along the way."
                )
                BlogPostEntry(
                    category: "Engineering",
                    date: "2026 \u{00B7} 02 \u{00B7} 05",
                    title: "The Case Against Client-Side Routing",
                    excerpt: "Why we chose server-driven navigation over SPA-style routing \u{2014} and how it changed the way we think about page transitions."
                )
                BlogPostEntry(
                    category: "Design",
                    date: "2026 \u{00B7} 01 \u{00B7} 18",
                    title: "Building a Syntax Theme from OKLCH",
                    excerpt: "Exploring perceptual color spaces to build a syntax highlighting palette that feels consistent across every language we support."
                )
                BlogPostEntry(
                    category: "Engineering",
                    date: "2025 \u{00B7} 12 \u{00B7} 30",
                    title: "How We Think About Dependencies",
                    excerpt: "Our philosophy on third-party packages \u{2014} when to reach for one, when to write our own, and why we keep the dependency graph shallow."
                )
                BlogPostEntry(
                    category: "Infrastructure",
                    date: "2025 \u{00B7} 12 \u{00B7} 12",
                    title: "Stage: Hosting Without the Complexity",
                    excerpt:
                        "Introducing Stage \u{2014} a deployment layer that does exactly what you need and nothing more. No regions to configure, no cold starts to worry about.",
                    isLast: true
                )
            }
            .flex(.column)
            .padding(40, at: .vertical)
            .padding(56, at: .horizontal)
            .compact { $0.padding(0, at: .vertical).padding(20, at: .horizontal) }
        }
    }
}

struct BlogPostEntry: Component {
    let category: String
    let date: String
    let title: String
    let excerpt: String
    let isLast: Bool

    init(
        category: String,
        date: String,
        title: String,
        excerpt: String,
        isLast: Bool = false
    ) {
        self.category = category
        self.date = date
        self.title = title
        self.excerpt = excerpt
        self.isLast = isLast
    }

    var body: some Node {
        Article {
            Text { category }
                .font(.mono, size: 11, weight: .medium, color: .accent)
                .padding(3, at: .vertical)
                .padding(8, at: .horizontal)
                .background(.elevated)
                .radius(3)

            Text { date }
                .font(.mono, size: 12, tracking: 1, color: .dimmer)

            Heading(.two) { title }
                .font(.serif, size: 22, weight: .medium, lineHeight: 1.2, color: .text)
                .compact { $0.font(size: 20) }

            Paragraph { excerpt }
                .font(.mono, size: 14, lineHeight: 1.6, color: .muted)
                .compact { $0.font(size: 13) }
        }
        .flex(.column, gap: 12)
        .padding(32, at: .vertical)
        .compact { $0.padding(24, at: .vertical).flex(.column, gap: 10) }
        .border(width: isLast ? 0 : 1, color: .border, style: .solid, at: .bottom)
    }
}
