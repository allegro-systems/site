import Score

struct NavDropdownItem: Component {
    let title: String
    let description: String
    let accentColor: ColorToken
    let link: String

    var body: some Node {
        Link(to: link) {
            Stack {}
                .size(width: 3)
                .background(accentColor)

            Stack {
                Text { title }
                    .font(.serif, size: 15, weight: .light, color: .text)

                Paragraph { description }
                    .font(.mono, size: 11, color: .muted)
            }
            .flex(.column)
        }
        .flex(.row, gap: 12, align: .stretch)
        .padding(8, at: .vertical)
        .padding(12, at: .horizontal)
        .font(decoration: TextDecoration.none)
        .hover(.background(.elevated))
        .radius(6)
    }
}

/// A header navigation dropdown that reveals items on hover.
struct NavDropdown<Content: Node>: Component {
    let label: String
    let link: String
    let panelWidth: Length
    let content: Content

    init(
        label: String,
        link: String,
        panelWidth: Length = 460,
        @NodeBuilder content: () -> Content
    ) {
        self.label = label
        self.link = link
        self.panelWidth = panelWidth
        self.content = content()
    }

    var body: some Node {
        Stack {
            Link(to: link) {
                Text { label }
                Icon("chevron-down", size: 12, color: .muted)
            }
            .flex(.row, gap: 4, align: .center)
            .font(.mono, size: 13, color: .text, decoration: TextDecoration.none)

            Stack {
                Stack { content }
                    .flex(.column)
                    .size(width: panelWidth)
                    .padding(8)
                    .background(.surface)
                    .border(width: 1, color: .border, style: .solid, radius: 8)
            }
            .position(.absolute, top: 20, leading: -16)
            .padding(12, at: .top)
            .zIndex(50)
            .showOnGroupHover()
        }
        .position(.relative)
        .hoverGroup()
    }
}

struct ProductsDropdown: Component {
    var body: some Node {
        NavDropdown(label: "Products", link: "/products") {
            NavDropdownItem(
                title: "Score",
                description: "Swift web framework for components, HTML, CSS & JS",
                accentColor: .score,
                link: "/score"
            )
            NavDropdownItem(
                title: "Stage",
                description: "Deploy, scale and observe Score applications",
                accentColor: .stage,
                link: "/stage"
            )
            NavDropdownItem(
                title: "Composer",
                description: "Native macOS & iPad visual editor for Score UIs",
                accentColor: .composer,
                link: "/composer"
            )
            NavDropdownItem(
                title: "Libretto",
                description: "Reference app built entirely on Score and Stage",
                accentColor: .libretto,
                link: "/libretto"
            )
        }
    }
}

struct DocsDropdown: Component {
    var body: some Node {
        NavDropdown(label: "Documentation", link: "/docs", panelWidth: 400) {
            NavDropdownItem(
                title: "Score",
                description: "Guides, API reference and tutorials",
                accentColor: .score,
                link: "/docs/score"
            )
            NavDropdownItem(
                title: "Stage",
                description: "Deployment guides and scaling configuration",
                accentColor: .stage,
                link: "/docs/stage"
            )
            NavDropdownItem(
                title: "Composer",
                description: "Visual editor workflows and component library",
                accentColor: .composer,
                link: "/docs/composer"
            )
        }
    }
}
