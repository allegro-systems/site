import Score

struct SiteLogo: Component {
    var body: some Node {
        Link(to: "/") {
            Text { "Allegro" }
                .font(.serif, size: 20, weight: .light, color: .text)
            Text { "Systems" }
                .font(.mono, size: 13, color: .muted)
        }
        .flex(.row, gap: 2, align: .start)
        .font(decoration: TextDecoration.none)
    }
}
