import Score

enum SiteButtonVariant {
    case primary(ColorToken)
    case secondary
}

@Component
struct SiteButton {
    let title: String
    let link: String
    let variant: SiteButtonVariant
    var opensInNewTab: Bool = false

    var body: some Node {
        switch variant {
        case .primary(let background):
            Link(to: link, opensInNewTab: opensInNewTab) { title }
                .font(.mono, size: 13, weight: .medium, color: .bg, align: .center, decoration: TextDecoration.none)
                .padding(14, at: .vertical)
                .padding(28, at: .horizontal)
                .size(minWidth: 180)
                .background(background)
                .hover { $0.opacity(0.85) }

        case .secondary:
            Link(to: link, opensInNewTab: opensInNewTab) { title }
                .font(.mono, size: 13, weight: .medium, color: .text, align: .center, decoration: TextDecoration.none)
                .padding(14, at: .vertical)
                .padding(28, at: .horizontal)
                .size(minWidth: 180)
                .border(width: 1, color: .border, style: .solid)
                .hover { $0.background(.elevated) }
        }
    }
}
