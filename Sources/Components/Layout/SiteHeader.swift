import Score

struct SiteHeader: Component {

    var body: some Node {
        Header {
            SiteLogo()
                .flexItem(grow: 1)

            Navigation {
                ProductsDropdown()
                DocsDropdown()

                Link(to: "/about") { "About" }
                    .font(.mono, size: 13, color: .text, decoration: TextDecoration.none)
                Link(to: "/blog") { "Blog" }
                    .font(.mono, size: 13, color: .text, decoration: TextDecoration.none)
            }
            .flex(.row, gap: 24, align: .center, justify: .center)
            .flexItem(grow: 1)
            .compact { $0.hidden() }

            Stack {
                Link(to: "https://github.com/allegro-systems/", opensInNewTab: true) {
                    Icon("github", size: 20, color: .text)
                }
                .flex(.row, align: .center)
                .font(decoration: TextDecoration.none)

                ThemeToggle()
            }
            .flex(.row, gap: 12, align: .center, justify: .end)
            .flexItem(grow: 1)
            .compact { $0.hidden() }

            MobileMenu()
        }
        .flex(.row, align: .center)
        .padding(16, at: .vertical)
        .padding(56, at: .horizontal)
        .compact { $0.padding(20, at: .horizontal).padding(16, at: .vertical) }
        .border(width: 1, color: .border, style: .solid, at: .bottom)
    }
}
