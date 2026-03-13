import Score

struct ThemeToggle: Component {
    static var scopeKey: String? { "theme" }

    @State(persisted: .theme) var isDark = false

    @Action
    mutating func toggle() {
        isDark.toggle()
    }

    var body: some Node {
        Button {
            Icon("sun", size: 16, color: .sun)
            Icon("moon", size: 16, color: .moon)
        }
        .on(.click, action: "toggle")
        .flex(.row, gap: 6, align: .center)
        .padding(6, at: .vertical)
        .padding(8, at: .horizontal)
        .background(.elevated)
        .border(width: 1, color: .border, style: .solid, radius: 20)
        .cursor(.pointer)
    }
}
