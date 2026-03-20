import Score
import ScoreLucide

@Component
struct FeatureCard {
    let icon: String
    let title: String
    let description: String
    var accentColor: ColorToken = .accent
    var large: Bool = false

    var body: some Node {
        Stack {
            if large {
                Stack {
                    Icon(icon, size: 24, color: accentColor)

                    Heading(.three) { title }
                        .font(.serif, size: 22, weight: .light, color: .text)
                        .margin(0)
                }
                .flex(.row, gap: 12, align: .center)

                Paragraph { description }
                    .font(.mono, size: 13, lineHeight: 1.6, color: .muted)
            } else {
                Icon(icon, size: 24, color: accentColor)

                Heading(.three) { title }
                    .font(.serif, size: 22, color: .text)
                    .margin(0)

                Paragraph { description }
                    .font(.mono, size: 13, lineHeight: 1.6, color: .muted, align: .start)
                    .margin(0)
            }
        }
        .flex(.column, gap: large ? 20 : 16, align: .start)
        .padding(large ? 32 : 24, at: .vertical)
        .padding(large ? 28 : 24, at: .horizontal)
        .background(.surface)
        .border(width: 1, color: .border, style: .solid, radius: large ? 0 : 8)
    }
}
