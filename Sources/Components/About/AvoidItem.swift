import Score
import ScoreLucide

@Component
struct AvoidItem {
    let title: String

    var body: some Node {
        Stack {
            Icon("x", size: 16, color: .muted)

            Text { title }
                .font(.mono, size: 14, color: .text)
        }
        .flex(.row, gap: 16, align: .center)
        .padding(24, at: .vertical)
        .padding(28, at: .horizontal)
        .border(width: 1, color: .border, style: .solid)
    }
}
