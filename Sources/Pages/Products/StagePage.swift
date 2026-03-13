import Score

struct StagePage: Page {
    static let path = "/stage"

    var body: some Node {
        ComingSoonProductLayout(
            name: "Stage",
            accentColor: .stage,
            heading: "The Hosting and\nOperations Layer",
            subtitle: "The hosting and operations layer",
            description: "Deploy, scale, and observe Score applications. Coming soon.",
            highlights: "Host Static Output  \u{00B7}  Host Runtime Binaries  \u{00B7}  Swift Workloads as First-Class Target",
            gradient: .radial(color: .stage, opacity: 0.04, width: 120, height: 80, at: .top),
            features: [
                .init(
                    icon: "rocket",
                    title: "Zero-Config Deploys",
                    description: "Deploy Swift applications with a single command. No configuration files, no boilerplate."
                ),
                .init(
                    icon: "globe",
                    title: "Edge-Native Routing",
                    description: "Automatic SSL, custom domains, and global edge distribution built in from day one."
                ),
                .init(
                    icon: "activity",
                    title: "Built-in Monitoring",
                    description: "Real-time logs, metrics, and health checks out of the box. Know exactly what\u{2019}s happening."
                ),
            ]
        )
    }
}
