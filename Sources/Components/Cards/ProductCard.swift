import Score

@Component
struct ProductCard {
    let title: String
    let description: String
    let accentColor: ColorToken
    var link: String? = nil
    var comingSoon: Bool = false

    var body: some Node {
        let card = Stack {
            Stack {}
                .size(width: 24, height: 3)
                .background(accentColor)

            Stack {
                Heading(.three) { title }
                    .font(.serif, size: 20, weight: .light, color: .text)

                if comingSoon {
                    Text { Localized("ui.coming_soon") }
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

            if link != nil {
                Text { Localized("ui.learn_more") }
                    .font(.mono, size: 13, weight: .medium, color: accentColor)
            } else {
                Stack {}
                    .size(height: 17)
            }
        }
        .flex(.column, gap: 12)
        .padding(20)
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
