import Score

struct DocCard: Component {
    let title: String
    let description: String
    let accentColor: ColorToken
    let link: String?
    let comingSoon: Bool
    let filled: Bool

    init(
        title: String,
        description: String,
        accentColor: ColorToken,
        link: String? = nil,
        comingSoon: Bool = false,
        filled: Bool = false
    ) {
        self.title = title
        self.description = description
        self.accentColor = accentColor
        self.link = link
        self.comingSoon = comingSoon
        self.filled = filled
    }

    var body: some Node {
        Stack {
            Stack {}
                .size(width: 32, height: 3)
                .background(accentColor)

            Stack {
                Heading(.three) { title }
                    .font(.serif, size: 20, weight: .light, color: comingSoon ? .muted : .text)

                if comingSoon {
                    Text { "Coming Soon" }
                        .font(.mono, size: 10, color: .muted)
                        .padding(3, at: .vertical)
                        .padding(8, at: .horizontal)
                        .border(width: 1, color: .border, style: .solid)
                }
            }
            .flex(.row, gap: 10, align: .center)

            Paragraph { description }
                .font(.mono, size: 13, lineHeight: 1.6, color: comingSoon ? .dimmer : .muted, align: .start)

            if let link {
                Link(to: link) { "Read docs \u{2192}" }
                    .font(.mono, size: 13, weight: .medium, color: accentColor, decoration: TextDecoration.none)
            }
        }
        .flex(.column, gap: 16)
        .padding(28)
        .size(minHeight: 180)
        .background(filled ? .surface : .bg)
        .border(width: 1, color: .border, style: .solid)
    }
}
