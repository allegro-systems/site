import Score

struct MobileMenu: Component {
    @State var isOpen = false

    @Action
    mutating func toggle() {
        isOpen.toggle()
    }

    var body: some Node {
        Stack {
            Button {
                Icon("menu", size: 22, color: .text)
            }
            .on(.click, action: "toggle")
            .cursor(.pointer)

            Stack {
                Navigation {
                    Link(to: "/products") { "Products" }
                        .font(.mono, size: 15, color: .text, decoration: TextDecoration.none)
                    Link(to: "/docs") { "Documentation" }
                        .font(.mono, size: 15, color: .text, decoration: TextDecoration.none)
                    Link(to: "/about") { "About" }
                        .font(.mono, size: 15, color: .text, decoration: TextDecoration.none)
                    Link(to: "/blog") { "Blog" }
                        .font(.mono, size: 15, color: .text, decoration: TextDecoration.none)
                }
                .flex(.column, gap: 16)

                Stack {
                    Link(to: "https://github.com/allegro-systems/", opensInNewTab: true) {
                        Icon("github", size: 20, color: .text)
                    }
                    .flex(.row, align: .center)
                    .font(decoration: TextDecoration.none)

                    ThemeToggle()
                }
                .flex(.row, gap: 12, align: .center)
            }
            .flex(.column, gap: 24, align: .center)
            .padding(20)
            .background(.surface)
            .border(width: 1, color: .border, style: .solid, at: .top)
            .position(.fixed, top: 53, leading: 0)
            .size(width: .percent(100))
            .zIndex(100)
            .animation(name: "score-fade-in", duration: 0.2, timing: .easeOut, fillMode: .forwards)
            .visible(when: "isOpen")
        }
        .hidden()
        .compact { $0.flex(.row, align: .center) }
    }
}
