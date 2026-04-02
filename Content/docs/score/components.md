---
title: Components
order: 3
section: Core Concepts
---

Components are reusable UI building blocks. Use the `@Component` macro to define them.

## Defining a component

```swift
@Component
struct FeatureCard {
    let title: String
    let description: String

    var body: some Node {
        Article {
            Heading(.three) { title }
                .font(.sans, size: 20, weight: .medium, color: .text)
            Paragraph { description }
                .font(.mono, size: 14, color: .muted)
        }
        .padding(24)
        .background(.elevated)
        .border(radius: 8)
    }
}
```

The `@Component` macro generates the protocol conformance for you. Components have a `body` property that returns nodes, just like pages.

## Using components

Drop them into any `@NodeBuilder` block:

```swift
struct FeaturesPage: Page {
    static let path = "/features"

    var body: some Node {
        Section {
            FeatureCard(title: "Fast", description: "Pre-rendered at build time.")
            FeatureCard(title: "Safe", description: "Type-checked by the compiler.")
            FeatureCard(title: "Simple", description: "Zero configuration theming.")
        }
        .grid(columns: 3, gap: 24)
    }
}
```

## @State

Add reactive state with the `@State` macro. Only components that use `@State` ship client-side JavaScript -- everything else is pure static HTML.

```swift
@Component
struct Counter {
    @State var count = 0

    @Action
    mutating func increment() { count += 1 }

    @Action
    mutating func decrement() { count -= 1 }

    var body: some Node {
        Stack {
            Text { $count }
                .font(.mono, size: 32, weight: .light, color: .text)
            Stack {
                Button { "\u{2212}" }.on(.click, action: "decrement")
                Button { "+" }.on(.click, action: "increment")
            }
            .flex(.row, gap: 8)
        }
        .flex(.column, gap: 12, align: .center)
    }
}
```

`@State` creates a reactive signal. When state changes, only the affected DOM nodes update -- no full-page re-render.

Use `$count` (dollar-prefix) to reference the signal in text bindings and event handlers.

## @Action

Actions are event handlers that modify state. Mark them with `@Action` and `mutating`:

```swift
@Component
struct Toggle {
    @State var isOn = false

    @Action
    mutating func toggle() { isOn.toggle() }

    var body: some Node {
        Button { isOn ? "ON" : "OFF" }
            .on(.click, action: "toggle")
    }
}
```

Bind actions to events with `.on(.click, action: "actionName")`.

## @Computed

Derived values that update automatically when their dependencies change:

```swift
@Component
struct TemperatureConverter {
    @State var celsius: Double = 0

    @Computed var fahrenheit: Double {
        celsius * 9 / 5 + 32
    }

    var body: some Node {
        Stack {
            Text { "Celsius: \($celsius)" }
            Text { "Fahrenheit: \($fahrenheit)" }
        }
        .flex(.column, gap: 8)
    }
}
```

## Persisted state

State can persist across page loads using the `persisted` parameter:

```swift
@State(persisted: .theme) var isDark = false        // Special theme persistence
@State(persisted: "volume") var volume = 50          // Custom localStorage key
```

The `.theme` persistence key is special -- it integrates with Score's dark mode system. String keys use `localStorage`.

## Grouped state

Group related state fields into a struct:

```swift
@State var input = ItemForm()
```

Access individual fields with dot syntax: `$input.title`, `$input.description`. Call `input.reset()` to restore all fields to their initial values.

This is useful for forms:

```swift
@Component
struct ItemEditor {
    @State var input = ItemForm()

    @Action
    mutating func submit() {
        // use input.title, input.description
        input.reset()
    }

    var body: some Node {
        Stack {
            Input(type: .text, placeholder: "Title", value: $input.title)
            Input(type: .text, placeholder: "Description", value: $input.description)
            Button { "Add" }.on(.click, action: "submit")
        }
        .flex(.column, gap: 12)
    }
}
```

## Conditional visibility

Show or hide elements based on state:

```swift
@State var isMenuOpen = false
@Action mutating func toggleMenu() { isMenuOpen.toggle() }

Button { "Menu" }.on(.click, action: "toggleMenu")
Stack { /* menu content */ }
    .visible(when: "isMenuOpen")
```

## Hover groups

Reveal a child element when its parent is hovered:

```swift
Stack {
    Text { "Hover me" }
    Stack { "Actions..." }
        .showOnGroupHover()
}
.hoverGroup()
```

The child with `.showOnGroupHover()` is hidden by default and shown when the `.hoverGroup()` parent is hovered.

## Component vs Page

- **Page** -- a struct with a `path` and a `body`. Mapped to a URL route. Registered in `Application.pages`.
- **Component** -- a struct with `@Component` and a `body`. Reusable UI with its own scope for state, actions, and styling. Used inside pages and other components.

For simple, stateless pieces of UI, you can use components without `@State` -- they render as pure static HTML. Reach for `@State` and `@Action` only when you need client-side interactivity.
