import Score

struct LibrettoPage: Page {
    static let path = "/libretto"

    var body: some Node {
        ComingSoonProductLayout(
            name: "Libretto",
            accentColor: .libretto,
            heading: "The Reference\nApplication",
            subtitle: "The first-party reference application",
            description: "A focused writing and publishing workspace \u{2014} and the live proof-of-concept for Score and Stage in production. Coming soon.",
            highlights: "Markdown-First Authoring  \u{00B7}  Integrated Publishing  \u{00B7}  Built on Score and Stage",
            gradient: .radial(color: .libretto, opacity: 0.04, width: 120, height: 80, at: .top),
            descriptionMaxWidth: 620,
            features: [
                .init(
                    icon: "file-text",
                    title: "Structured Writing",
                    description: "Markdown-first authoring with frontmatter and rich media embeds."
                ),
                .init(
                    icon: "send",
                    title: "Integrated Publishing",
                    description: "Publish directly from the editor to your Score-powered site."
                ),
                .init(
                    icon: "git-branch",
                    title: "Version History",
                    description: "Full revision tracking with diffs and rollback support."
                ),
            ]
        )
    }
}
