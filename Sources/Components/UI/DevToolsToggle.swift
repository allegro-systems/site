import Score
import ScoreLucide

@Component
struct DevToolsToggle {
    @State var devToolsHidden = true

    @Action
    mutating func toggle() {
        devToolsHidden.toggle()
    }

    var body: some Node {
        Group {
            // SCORE-GAP: Need CSS-only way to target #score-devtools-root visibility
            // from a @State variable. For now, the devtools root is hidden via the
            // theme's default CSS rather than an inline <style> tag.

            Button {
                Icon("code", size: 16, color: .text)
            }
            .on(.click, action: "toggle")
            .flex(.row, align: .center, justify: .center)
            .padding(6)
            .background(.elevated)
            .border(width: 1, color: .border, style: .solid, radius: 20)
            .cursor(.pointer)
            .opacity(0.6)
            .hover { $0.opacity(1) }
            .transition(property: .opacity, duration: 0.15, timing: .ease)
        }
    }
}
