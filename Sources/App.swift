import Score

/// The Allegro Systems marketing and documentation site.
@main
struct AllegroSite: Application {
    var theme: (any Theme)? { AllegroTheme() }

    var metadata: (any Metadata)? { nil }

    @PageBuilder
    var pages: [any Page] {
        HomePage()
        ProductsPage()
        ScorePage()
        StagePage()
        ComposerPage()
        LibrettoPage()
        DocsPage()
        AboutPage()
        BlogPage()
        NotFoundPage()
    }

    var errorPage: (any ErrorPage.Type)? { nil }
}
