import Score

struct ComposerPage: Page {
    static let path = "/composer"

    var body: some Node {
        ComingSoonProductLayout(
            name: "Composer",
            accentColor: .composer,
            heading: "The Visual Editor\nfor macOS and iPad",
            subtitle: "The native macOS and iPad visual editor",
            description: "A native visual editor for macOS and iPad that lets you design and build Score projects without writing code. Drag-and-drop components, live preview, and deterministic production builds powered by Stage. Coming soon.",
            highlights: "Visual-First Onboarding  \u{00B7}  Single-Worker Model  \u{00B7}  Deterministic Builds via Stage",
            gradient: .radial(color: .composer, opacity: 0.04, width: 100, height: 100, at: .center),
            features: [
                .init(
                    icon: "layout-dashboard",
                    title: "Visual Canvas Editor",
                    description: "Design layouts with a native macOS and iPad drag-and-drop editor. Build visually, export cleanly."
                ),
                .init(
                    icon: "eye",
                    title: "Live Preview",
                    description: "See changes rendered in real-time as you build. What you see is what ships to production."
                ),
                .init(
                    icon: "blocks",
                    title: "Component Library",
                    description: "Reusable building blocks that sync with your Score project. Compose once, use everywhere."
                ),
            ]
        )
    }
}
