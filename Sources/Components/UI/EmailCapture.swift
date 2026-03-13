import Score

struct EmailCapture: Component {

    var body: some Node {
        Form(action: "#", method: .post) {
            Input(type: .email, name: "email", placeholder: "your@email.com")
                .font(.mono, size: 13, color: .dimmer)
                .padding(10, at: .vertical)
                .padding(16, at: .horizontal)
                .border(width: 1, color: .border, style: .solid)
                .background(.surface)
                .size(width: 260)
                .compact { $0.size(width: .percent(100)) }

            Button(type: .submit) { "Notify Me" }
                .font(.mono, size: 13, weight: .medium, color: .bg)
                .padding(10, at: .vertical)
                .padding(20, at: .horizontal)
                .background(.text)
                .border(width: 0, color: .border, style: .none)
                .compact { $0.size(width: .percent(100)).font(align: .center) }
        }
        .flex(.row, align: .center)
        .compact { $0.flex(.column, gap: 12) }
    }
}
