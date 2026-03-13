import Score

struct ComingSoonCard: Component {
    let icon: String
    let title: String
    let description: String
    let accentColor: ColorToken
    let small: Bool

    init(
        icon: String,
        title: String,
        description: String,
        accentColor: ColorToken,
        small: Bool = false
    ) {
        self.icon = icon
        self.title = title
        self.description = description
        self.accentColor = accentColor
        self.small = small
    }

    var body: some Node {
        Stack {
            Stack {
                Icon(icon, size: small ? 22 : 24, color: accentColor)

                Heading(.three) { title }
                    .font(.serif, size: small ? 20 : 22, color: .text)
                    .margin(0)
            }
            .flex(.row, gap: 12, align: .center)

            Paragraph { description }
                .font(.mono, size: small ? 12 : 13, lineHeight: 1.6, color: .muted)
        }
        .flex(.column, gap: 16)
        .padding(32)
        .background(.surface)
        .border(width: 1, color: .border, style: .solid, radius: 8)
    }
}
