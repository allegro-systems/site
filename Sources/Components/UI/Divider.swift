import Score

/// A horizontal divider line styled with the theme border color.
@Component
struct Divider {
    var body: some Node {
        HorizontalRule()
            .background(.border)
            .size(height: 1)
            .border(width: 0, color: .border, style: .none)
    }
}
