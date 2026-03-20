import Score
import ScoreLucide

@Component
struct DevToolsToggle {

    var body: some Node {
        Group {
            RawTextNode("<style>#score-devtools-root{display:none}</style>")

            Button {
                Icon("code", size: 16, color: .text)
            }
            .htmlAttribute("onclick", "window.__scoreDevTools?.toggle()")
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
