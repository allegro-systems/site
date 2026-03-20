import Score

@Component
struct SectionLabel {
    let title: String

    var body: some Node {
        Text { title }
            .font(.mono, size: 12, weight: .medium, tracking: 3, color: .muted, transform: .uppercase)
    }
}
