import Score

@Component
struct AboutPrinciple {
    let title: String
    let description: String

    var body: some Node {
        Stack {
            Heading(.three) { title }
                .font(.serif, size: 18, color: .text)

            Paragraph { description }
                .font(.mono, size: 13, lineHeight: 1.6, color: .muted)
        }
        .flex(.column, gap: 12)
        .padding(28)
        .border(width: 1, color: .border, style: .solid)
    }
}
