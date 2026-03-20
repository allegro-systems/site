// swift-tools-version: 6.2
import PackageDescription

let package = Package(
    name: "AllegroSite",
    platforms: [.macOS(.v14)],
    dependencies: [
        .package(path: "../score"),
        .package(path: "../score-plugins/score-lucide"),
        .package(path: "../score-plugins/allegro-theme"),
    ],
    targets: [
        .executableTarget(
            name: "AllegroSite",
            dependencies: [
                .product(name: "Score", package: "Score"),
                .product(name: "ScoreLucide", package: "score-lucide"),
                .product(name: "AllegroTheme", package: "allegro-theme"),
            ],
            path: "Sources"
        )
    ]
)
