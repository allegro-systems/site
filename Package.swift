// swift-tools-version: 6.2
import PackageDescription

let package = Package(
    name: "AllegroSite",
    platforms: [.macOS(.v14)],
    dependencies: [
        .package(url: "https://github.com/allegro-systems/score.git", branch: "main"),
        .package(url: "https://github.com/allegro-systems/score-lucide.git", branch: "main"),
        .package(url: "https://github.com/allegro-systems/score-oauth.git", branch: "main"),
        .package(url: "https://github.com/allegro-systems/allegro-theme.git", branch: "main"),
    ],
    targets: [
        .executableTarget(
            name: "AllegroSite",
            dependencies: [
                .product(name: "Score", package: "Score"),
                .product(name: "ScoreLucide", package: "score-lucide"),
                .product(name: "ScoreOAuth", package: "score-oauth"),
                .product(name: "AllegroTheme", package: "allegro-theme"),
            ],
            path: "Sources"
        )
    ]
)
