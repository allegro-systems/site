import Score

struct LibrettoPage: Page {
    static let path = "/libretto"

    var body: some Node {
        ComingSoonProductLayout(
            name: "Libretto",
            accentColor: .libretto,
            heading: "A Platform\nfor Writers",
            subtitle: "Write, publish, and grow your audience",
            description: "A blogging platform built for developers and technical writers \u{2014} powered by Score and Stage. A rich editing experience, distraction-free, and designed to let your ideas reach the right people. Coming soon.",
            highlights: "Rich Text Editor  \u{00B7}  Developer-Focused  \u{00B7}  Built-In Discovery",
            gradient: .radial(color: .libretto, opacity: 0.04, width: 120, height: 80, at: .top),
            descriptionMaxWidth: 620,
            features: [
                .init(
                    icon: "edit-3",
                    title: "Rich Text Editor",
                    description: "A block-based editor with rich formatting, media embeds, and optional Markdown mode for when you want it."
                ),
                .init(
                    icon: "users",
                    title: "Discovery Feed",
                    description: "Follow writers, curate reading lists, and surface posts through tags and recommendations."
                ),
                .init(
                    icon: "trending-up",
                    title: "Audience Analytics",
                    description: "Understand who reads your work with built-in stats on views, reads, and engagement."
                ),
            ]
        )
    }
}
