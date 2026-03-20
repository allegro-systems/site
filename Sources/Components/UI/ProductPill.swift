import Score

@Component
struct ProductPill {
    let title: String
    let color: ColorToken

    var body: some Node {
        Text { title }
            .font(.mono, size: 11, weight: .medium, tracking: 1, color: color)
            .padding(5, at: .vertical)
            .padding(14, at: .horizontal)
            .border(width: 1, color: color, style: .solid)
    }
}
