import Score

@Component
struct DocCard {
    let title: String
    let description: String
    let accentColor: ColorToken
    var link: String? = nil
    var comingSoon: Bool = false
    var filled: Bool = false

    var body: some Node {
        let card = Stack {
            Stack {}
                .size(width: 32, height: 3)
                .background(accentColor)

            Stack {
                Heading(.three) { title }
                    .font(.serif, size: 20, weight: .light, color: comingSoon ? .muted : .text)

                if comingSoon {
                    Text { Localized("ui.coming_soon") }
                        .font(.mono, size: 10, color: .muted)
                        .padding(3, at: .vertical)
                        .padding(8, at: .horizontal)
                        .border(width: 1, color: .border, style: .solid)
                }
            }
            .flex(.row, gap: 10, align: .center)

            Paragraph { description }
                .font(.mono, size: 13, lineHeight: 1.6, color: comingSoon ? .dimmer : .muted, align: .start)

            if link != nil {
                Text { Localized("ui.read_docs") }
                    .font(.mono, size: 13, weight: .medium, color: accentColor)
            }
        }
        .flex(.column, gap: 16)
        .padding(28)
        .size(minHeight: 180)
        .background(filled ? .surface : .bg)
        .border(width: 1, color: .border, style: .solid)
        .hover { $0.borderColor(accentColor) }
        .transition(property: .borderColor, duration: 0.15, timing: .ease)

        if let link {
            Link(to: link) { card }
                .font(color: .text, decoration: TextDecoration.none)
                .hover { $0.font(decoration: TextDecoration.none) }
                .cursor(.pointer)
        } else {
            card
        }
    }
}
