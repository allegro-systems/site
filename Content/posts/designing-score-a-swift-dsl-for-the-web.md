---
title: Designing Score: A Swift DSL for the Web
category: Design
date: 2026-02-21
excerpt: The motivations behind building a declarative Swift DSL for generating semantic HTML — and the tradeoffs we made along the way.
---

Score started with a question: what would web development look like if you could use Swift's type system to guarantee valid HTML output?

Not a template engine. Not a string builder. A real DSL where the compiler catches your mistakes and the language's expressiveness works in your favor.

## Why a DSL instead of templates

Template languages are string-based. They concatenate fragments of HTML with interpolated values and hope the result is well-formed. There's no compiler checking that your `div` is closed, that your attributes are valid, or that your CSS class names actually exist.

A Swift DSL changes the equation. Every node in the document tree is a typed value. Composition happens through result builders, not string concatenation. The compiler enforces structure at every level.

```swift
struct HomePage: Page {
    static let path = "/"

    var body: some Node {
        Section {
            Heading(.one) { "Welcome" }
            Paragraph { "Built with Score." }
        }
        .padding(40, at: .vertical)
    }
}
```

This isn't generating HTML from a template — it's building a typed node tree that the framework renders into semantic HTML and scoped CSS.

## The modifier pattern

Score borrows the modifier pattern from SwiftUI: small, composable transformations that chain naturally. But instead of targeting UIKit or AppKit views, Score's modifiers emit CSS.

```swift
Text { "Hello" }
    .font(.mono, size: 14, weight: .medium, color: .accent)
    .padding(12, at: .horizontal)
    .background(.elevated)
    .radius(4)
```

Each modifier adds a scoped CSS rule. The framework collects them during rendering, deduplicates shared rules, and emits minimal stylesheets per page.

## Components as the unit of reuse

Score components are structs that conform to the `Component` protocol. They're lightweight, composable, and stateless by default. When you need state, the `@State` macro opts a component into Score's reactive system — but only that component ships client-side code.

```swift
struct Counter: Component {
    @State var count = 0

    var body: some Node {
        Button(.click, $count.increment()) {
            Text { "Count: \($count)" }
        }
    }
}
```

## The tradeoffs

A Swift DSL means you need a Swift toolchain. Your team needs to know Swift. Your CI needs to compile Swift. These aren't trivial constraints.

We also chose to emit HTML rather than implement a custom rendering target. That means we're bound by what HTML and CSS can express — no custom layout algorithms, no pixel-perfect rendering guarantees across browsers.

But for the kind of sites Score targets — marketing pages, documentation, blogs, dashboards — these tradeoffs are favorable. You get type safety, compiler-driven correctness, and a development experience that feels native to Swift developers.
