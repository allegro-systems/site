import Score

@Component
struct CategoryBadge {
    let title: String

    var body: some Node {
        Text { title }
            .font(.mono, size: 11, weight: .medium, color: .accent)
            .padding(3, at: .vertical)
            .padding(8, at: .horizontal)
            .background(.elevated)
            .radius(3)
    }
}
