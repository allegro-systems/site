import Score

struct FeatureCard: Component {
    let icon: String
    let title: String
    let description: String

    var body: some Node {
        Stack {
            Icon(icon, size: 24, color: .accent)

            Heading(.three) { title }
                .font(.serif, size: 22, color: .text)

            Paragraph { description }
                .font(.mono, size: 13, lineHeight: 1.6, color: .muted, align: .start)
        }
        .flex(.column, gap: 16, align: .start)
        .padding(32)
        .background(.surface)
        .border(width: 1, color: .border, style: .solid, radius: 8)
    }
}
