import Score
import ScoreLucide
import AllegroTheme

/// The Allegro Systems marketing and documentation site.
@main
struct AllegroSite: Application {
    var theme: (any Theme)? { AllegroTheme() }

    var plugins: [any ScorePlugin] { [LucidePlugin()] }

    var metadata: (any Metadata)? { nil }

    // swiftlint:disable:next force_try
    private static let _localization: Localization? = try! Localization(
        catalog: StringCatalog.load(from: "Localizable.xcstrings")
    )

    var localization: Localization? { Self._localization }

    @PageBuilder
    var pages: [any Page] {
        HomePage()
        ProductsPage()
        ScorePage()
        StagePage()
        ComposerPage()
        LibrettoPage()
        DocsPage()
        ScoreDocsPages()
        StageDocsPage()
        ComposerDocsPage()
        AboutPage()
        BlogPage()
        BlogPostPages()
    }

    var errorPage: (any ErrorPage.Type)? { NotFoundPage.self }
}
