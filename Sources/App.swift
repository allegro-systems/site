import AllegroTheme
import Foundation
import Score
import ScoreLucide
import ScoreOAuth

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
                    )
                ]
            ),
        ]
    }

    var metadata: (any Metadata)? {
        SiteMetadata(
            site: "Allegro",
            description: t("meta.description", default: "Build and deploy Swift web apps with Score, Stage, Composer, and Libretto."),
            baseURL: "https://allegro.systems"
        )
    }

    @PageBuilder
    var pages: [any Page] {
        HomePage()
        ProductPages()
        DocPages()
        AboutPage()
        BlogPages()
    }

    var errorPage: (any ErrorPage.Type)? { NotFoundPage.self }
}
