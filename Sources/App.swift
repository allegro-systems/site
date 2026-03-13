import ScoreRuntime

/// The Allegro Systems marketing and documentation site.
@main
struct AllegroSite: Application {
    var theme: (any Theme)? { AllegroTheme() }

    var metadata: (any Metadata)? {}

    @PageBuilder
    var pages: [any Page] {

    }

    var errorPage: (any ErrorPage.Type)? {}
}
