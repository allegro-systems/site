import AllegroTheme
import Score
import ScoreLucide

@Component
struct SiteHeader {
    let pagePath: String

    init(pagePath: String = "/") {
        self.pagePath = pagePath
    }

    var body: some Node {
        Header {
            SiteLogo()
                .flex(grow: 1)

            Stack {
                Navigation {
                    ProductsDropdown()
                    DocsDropdown()

                    Link(to: "/about") { t("nav.about") }
                        .font(.mono, size: 13, color: .text, decoration: TextDecoration.none)
                    Link(to: "https://libretto.allegro.systems/blog") { t("nav.blog") }
                        .font(.mono, size: 13, color: .text, decoration: TextDecoration.none)
                }
                .flex(.row, gap: 24, align: .center, justify: .center)
            }
            .flex(grow: 1)
            .compact { $0.hidden() }

            Stack {
                Link(to: "https://github.com/allegro-systems/", opensInNewTab: true) {
                    Icon("github", size: 20, color: .text)
                }
                .flex(.row, align: .center)
                .font(decoration: TextDecoration.none)

                LanguageDropdown(pagePath: pagePath)
                ThemeToggle()
            }
            .flex(.row, gap: 12, align: .center, justify: .end)
            .flex(grow: 1)
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
