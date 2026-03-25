import Foundation
import Score
import ScoreLucide
import ScoreOAuth
import AllegroTheme

/// The Allegro Systems marketing and documentation site.
///
/// Primarily static — all pages pre-render to HTML at build time.
/// The only dynamic route is the shared OAuth callback that redirects
/// authorization codes back to the originating product (Libretto, Stage Dashboard).
@main
struct AllegroSite: Application {
    var theme: (any Theme)? { AllegroTheme() }

    var plugins: [any ScorePlugin] {
        [
            LucidePlugin(),
            OAuthPlugin(
                providers: [
                    .github(
                        clientId: ProcessInfo.processInfo.environment["GITHUB_CLIENT_ID"] ?? "",
                        clientSecret: ProcessInfo.processInfo.environment["GITHUB_CLIENT_SECRET"] ?? ""
                    ),
                ]
            ),
        ]
    }

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
