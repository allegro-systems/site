// swift-tools-version: 6.2
import PackageDescription

let package = Package(
    name: "AllegroSite",
    platforms: [.macOS(.v14)],
    dependencies: [
        .package(path: "../score")
    ],
    targets: [
        .executableTarget(
            name: "AllegroSite",
            dependencies: [
                .product(name: "Score", package: "Score")
            ],
            path: "Sources"
        )
    ]
)
