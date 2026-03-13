import Score

/// A Lucide icon rendered via the lucide-static icon font.
///
/// Uses CSS class names from the lucide-static font package. The icon
/// name should be the kebab-case Lucide name (e.g. `"zap"`, `"book-open"`).
///
/// ```swift
/// Icon("zap", size: 24, color: .accent)
/// ```
struct Icon: Component {
    let name: String
    let size: Double
    let color: ColorToken

    init(_ name: String, size: Double = 20, color: ColorToken = .text) {
        self.name = name
        self.size = size
        self.color = color
    }

    var body: some Node {
        Stack {}
            .className("icon-\(name)")
            .font(size: size, lineHeight: 1, color: color)
            .size(width: .pixels(size), height: .pixels(size))
            .flex(.row, align: .center, justify: .center)
    }
}
