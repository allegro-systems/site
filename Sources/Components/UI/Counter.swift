import Score

/// A simple counter component used in the Score marketing page example.
///
/// Demonstrates `@State` and `@Action` with a reactive text binding
/// and a click event handler.
@Component
struct Counter {
    @State var count = 0

    @Action
    mutating func increment() {
        count += 1
    }

    var body: some Node {
        Stack {
            Text { "Count:" }
                .font(.serif, size: 20, weight: .light, color: .text)
            $count
        }
        .flex(.row, gap: 6, align: .baseline)

        Button {
            Text { "Increment" }
                .font(.mono, size: 13, weight: .medium, color: .score)
        }
        .on(.click, action: "increment")
        .padding(8, at: .vertical)
        .padding(16, at: .horizontal)
        .border(width: 1, color: .score, style: .solid, radius: 6)
        .cursor(.pointer)
    }
}
