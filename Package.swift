// swift-tools-version: 6.3
import PackageDescription

let package = Package(
    name: "AllegroSite",
    platforms: [.macOS(.v14)],
    dependencies: [
        .package(path: "../../framework/score"),
        .package(path: "../../framework/plugins/score-lucide"),
        .package(path: "../../framework/plugins/score-oauth"),
        .package(path: "../../framework/plugins/allegro-theme"),
    ],
    targets: [
        .executableTarget(
            name: "AllegroSite",
            dependencies: [
                .product(name: "Score", package: "score"),
                .product(name: "ScoreLucide", package: "score-lucide"),
                .product(name: "ScoreOAuth", package: "score-oauth"),
                .product(name: "AllegroTheme", package: "allegro-theme"),
            ],
            path: "Sources"
        )
    ]
)
