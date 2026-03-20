import Score
import ScoreLucide

@Component
struct SiteFooter {

    var body: some Node {
        Footer {
            Stack {
                Stack {
                    SiteLogo()

                    Paragraph { Localized("footer.tagline") }
                        .font(.mono, size: 12, color: .dimmer)
                }
                .flex(.column, gap: 8, align: .start)
                .flexItem(grow: 1, basis: 0)
                .compact { $0.flex(.column, gap: 8, align: .center) }

                Navigation {
                    Link(to: "/products") { Localized("nav.products") }
                        .font(.mono, size: 13, color: .muted, decoration: TextDecoration.none)
                    Link(to: "/docs") { Localized("nav.docs") }
                        .font(.mono, size: 13, color: .muted, decoration: TextDecoration.none)
                    Link(to: "/about") { Localized("nav.about") }
                        .font(.mono, size: 13, color: .muted, decoration: TextDecoration.none)
                    Link(to: "/blog") { Localized("nav.blog") }
                        .font(.mono, size: 13, color: .muted, decoration: TextDecoration.none)
                }
                .flex(.row, gap: 24, align: .start, justify: .center)
                .flexItem(grow: 1, basis: 0)
                .compact { $0.flex(.column, gap: 12, align: .center) }

                Link(to: "https://github.com/allegro-systems", opensInNewTab: true) {
                    Icon("github", size: 20, color: .muted)
                }
                .flex(.row, align: .start, justify: .end)
                .flexItem(grow: 1, basis: 0)
                .font(decoration: TextDecoration.none)
            }
            .flex(.row, align: .start, justify: .spaceBetween)
            .compact { $0.flex(.column, gap: 24, align: .center) }

            Stack {
                Paragraph { Localized("footer.copyright") }
                    .font(.mono, size: 11, color: .dimmer)
                    .compact { $0.font(size: 10) }
            }
            .flex(.row, justify: .center)
        }
        .flex(.column, gap: 40)
        .padding(56)
        .border(width: 1, color: .border, style: .solid, at: .top)
        .compact { $0.padding(40, at: .vertical).padding(20, at: .horizontal) }
    }
}
