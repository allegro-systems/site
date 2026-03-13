import Score

struct ScoreFeatureCard: Component {
    let icon: String
    let title: String
    let description: String
    let large: Bool

    init(
        icon: String,
        title: String,
        description: String,
        large: Bool = false
    ) {
        self.icon = icon
        self.title = title
        self.description = description
        self.large = large
    }

    var body: some Node {
        Stack {
            Stack {
                Icon(icon, size: large ? 24 : 20, color: .score)

                Heading(.three) { title }
                    .font(.serif, size: large ? 22 : 18, weight: .light, color: .text)
                    .margin(0)
            }
            .flex(.row, gap: 12, align: .center)

            Paragraph { description }
                .font(.mono, size: large ? 13 : 12, lineHeight: 1.6, color: .muted)
        }
        .flex(.column, gap: large ? 20 : 12)
        .padding(large ? 32 : 24, at: .vertical)
        .padding(large ? 28 : 24, at: .horizontal)
        .background(large ? .surface : .bg)
        .border(width: 1, color: .border, style: .solid)
    }
}
