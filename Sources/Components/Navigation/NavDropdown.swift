import Score
import ScoreLucide

@Component
struct NavDropdownItem {
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

                Text { description }
                    .font(.mono, size: 11, color: .muted)
            }
            .flex(.column)
        }
        .flex(.row, gap: 12, align: .stretch)
        .padding(8, at: .vertical)
        .padding(12, at: .horizontal)
        .font(decoration: TextDecoration.none)
        .hover { $0.background(.elevated) }
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

@Component
struct ProductsDropdown {
    var body: some Node {
        NavDropdown(label: t("nav.products"), link: "/products") {
            NavDropdownItem(
                title: t("nav.products.score"),
                description: t("nav.products.score.desc"),
                accentColor: .score,
                link: "/score"
            )
            NavDropdownItem(
                title: t("nav.products.stage"),
                description: t("nav.products.stage.desc"),
                accentColor: .stage,
                link: "/stage"
            )
            NavDropdownItem(
                title: t("nav.products.composer"),
                description: t("nav.products.composer.desc"),
                accentColor: .composer,
                link: "/composer"
            )
            NavDropdownItem(
                title: t("nav.products.libretto"),
                description: t("nav.products.libretto.desc"),
                accentColor: .libretto,
                link: "/libretto"
            )
        }
    }
}

@Component
struct DocsDropdown {
    var body: some Node {
        NavDropdown(label: t("nav.documentation"), link: "/docs", panelWidth: 400) {
            NavDropdownItem(
                title: t("nav.products.score"),
                description: t("nav.docs.score.desc"),
                accentColor: .score,
                link: "/docs/score"
            )
            NavDropdownItem(
                title: t("nav.products.stage"),
                description: t("nav.docs.stage.desc"),
                accentColor: .stage,
                link: "/docs/stage"
            )
            NavDropdownItem(
                title: t("nav.products.composer"),
                description: t("nav.docs.composer.desc"),
                accentColor: .composer,
                link: "/docs/composer"
            )
        }
    }
}
