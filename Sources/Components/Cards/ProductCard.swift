import Score

struct ProductCard: Component {
    let title: String
    let description: String
    let accentColor: ColorToken
    let link: String?
    let comingSoon: Bool

    init(
        title: String,
        description: String,
        accentColor: ColorToken,
        link: String? = nil,
        comingSoon: Bool = false
    ) {
        self.title = title
        self.description = description
        self.accentColor = accentColor
        self.link = link
        self.comingSoon = comingSoon
    }

    var body: some Node {
        Stack {
            Stack {}
                .size(width: 32, height: 3)
                .background(accentColor)

            Stack {
                Heading(.three) { title }
                    .font(.serif, size: 24, weight: .light, color: .text)

                if comingSoon {
                    Text { "Coming Soon" }
                        .font(.mono, size: 10, color: .muted)
                        .padding(3, at: .vertical)
                        .padding(8, at: .horizontal)
                        .border(width: 1, color: .border, style: .solid)
                        .flexItem(shrink: 0)
                }
            }
            .flex(.row, gap: 8, align: .center)

            Paragraph { description }
                .font(.mono, size: 13, lineHeight: 1.6, color: .muted, align: .start)
                .flexItem(grow: 1)

            if let link {
                Link(to: link) { "Learn more \u{2192}" }
                    .font(.mono, size: 13, weight: .medium, color: accentColor, decoration: TextDecoration.none)
            } else {
                Stack {}
                    .size(height: 17)
            }
        }
        .flex(.column, gap: 16)
        .padding(28)
        .size(minHeight: 190)
        .border(width: 1, color: .border, style: .solid)
    }
}
