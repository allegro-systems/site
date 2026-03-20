import Score

@Component
struct SiteLogo {
    var body: some Node {
        Link(to: "/") {
            Text { Localized("logo.allegro") }
                .font(.serif, size: 20, weight: .light, color: .text)
            Text { Localized("logo.systems") }
                .font(.mono, size: 13, color: .muted)
        }
        .flex(.row, gap: 2, align: .start)
        .font(decoration: TextDecoration.none)
    }
}
