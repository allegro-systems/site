import Score

struct ComposerPage: Page {
    static let path = "/composer"

    var metadata: (any Metadata)? {
        SiteMetadata(
            title: t("meta.composer.title", default: "Composer"),
            description: t("meta.composer.description", default: "A native visual editor for macOS and iPad that lets you design Score projects without writing code.")
        )
    }

    var body: some Node {
        ComingSoonProductLayout(
            name: "Composer",
            accentColor: .composer,
            heading: t("composer.hero.title", default: "The Visual Editor\nfor macOS and iPad"),
            subtitle: "",
            description: t("composer.hero.description", default: "A native visual editor for macOS and iPad that lets you design and build Score projects without writing code. Drag-and-drop components, live preview, and deterministic production builds powered by Stage. Coming soon."),
            highlights: t("composer.hero.highlights", default: "Visual-First Onboarding  \u{00B7}  Single-Worker Model  \u{00B7}  Deterministic Builds via Stage"),
            gradient: .radial(color: .composer, opacity: 0.04, width: 100, height: 100, at: .center),
            features: [
                .init(
                    icon: "layout-dashboard",
                    title: t("composer.feature.visual.title", default: "Visual Canvas Editor"),
                    description: t("composer.feature.visual.description", default: "Design layouts with a native macOS and iPad drag-and-drop editor. Build visually, export cleanly.")
                ),
                .init(
                    icon: "eye",
                    title: t("composer.feature.preview.title", default: "Live Preview"),
                    description: t("composer.feature.preview.description", default: "See changes rendered in real-time as you build. What you see is what ships to production.")
                ),
                .init(
                    icon: "blocks",
                    title: t("composer.feature.library.title", default: "Component Library"),
                    description: t("composer.feature.library.description", default: "Reusable building blocks that sync with your Score project. Compose once, use everywhere.")
                ),
            ]
        )
    }
}
