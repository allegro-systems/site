import Score

@Component
struct BlogPostEntry {
    let category: String
    let date: String
    let title: String
    let excerpt: String
    let link: String
    var isLast: Bool = false

    var body: some Node {
        Link(to: link) {
            Article {
                CategoryBadge(title: category)

                Text { date }
                    .font(.mono, size: 12, tracking: 1, color: .dimmer)

                Heading(.two) { title }
                    .font(.serif, size: 22, weight: .medium, lineHeight: 1.2, color: .text)
                    .compact { $0.font(size: 20) }

                Paragraph { excerpt }
                    .font(.mono, size: 14, lineHeight: 1.6, color: .muted)
                    .compact { $0.font(size: 13) }
            }
            .flex(.column, gap: 12)
            .padding(32, at: .vertical)
            .compact { $0.padding(24, at: .vertical).flex(.column, gap: 10) }
            .border(width: isLast ? 0 : 1, color: .border, style: .solid, at: .bottom)
        }
    }
}
