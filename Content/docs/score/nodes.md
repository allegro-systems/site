---
title: Nodes
order: 6
section: Core Concepts
---

Nodes are the building blocks of every Score page. Every element -- text, headings, images, containers -- is a node.

## Container nodes

### Stack

The general-purpose layout container. Renders a `<div>`. Pair it with `.flex()` or `.grid()`:

```swift
Stack {
    Heading(.two) { "Title" }
    Paragraph { "Content goes here." }
}
.flex(.column, gap: 16)
```

Only use `Stack` when you need layout behavior. Don't wrap single elements in a Stack just for grouping.

### Semantic containers

These map directly to their HTML counterparts:

```swift
Section {
    // Page section
}

Article {
    // Self-contained content
}

Aside {
    // Sidebar or supplementary content
}

Navigation {
    // Navigation links (renders <nav>)
}

Main {
    // Primary page content
}

Header {
    // Page or section header
}

Footer {
    // Page or section footer
}
```

### Group

Transparent container -- renders its children without any wrapping element:

```swift
Group {
    Text { "One" }
    Text { "Two" }
}
```

## Text nodes

### Heading

```swift
Heading(.one) { "Page Title" }
Heading(.two) { "Section Title" }
Heading(.three) { "Subsection" }
```

Levels `.one` through `.six`, mapping to `<h1>` through `<h6>`.

### Paragraph

```swift
Paragraph { "Body text goes here." }
```

### Text

Inline text. Renders a `<span>`:

```swift
Text { "A span of text." }
```

Use it for inline content within other elements:

```swift
Paragraph {
    Text { "This is " }
    Text { "bold" }
        .font(weight: .bold)
    Text { " text." }
}
```

### Code

Inline code element:

```swift
Code { "let x = 42" }
    .font(.mono, size: 13, color: .accent)
    .background(.surface)
    .padding(4, at: .horizontal)
    .border(radius: 4)
```

## Lists

```swift
UnorderedList {
    ListItem { "First item" }
    ListItem { "Second item" }
    ListItem { "Third item" }
}

OrderedList {
    ListItem { "Step one" }
    ListItem { "Step two" }
}
```

## Interactive nodes

### Link

```swift
Link(to: "/about") { "About us" }
Link(to: "https://github.com", external: true) { "GitHub" }
```

### Button

```swift
Button { "Click me" }
    .on(.click, action: "handleClick")
```

Buttons in forms:

```swift
Button(type: .submit) { "Save" }
Button(type: .button) { "Cancel" }
```

## Form nodes

### Form

```swift
Form(action: "/auth/login", method: .post) {
    Label(for: "email") { "Email" }
    Input(type: .email, name: "email", placeholder: "you@example.com")

    Label(for: "message") { "Message" }
    TextArea(name: "message", placeholder: "Your message...", rows: 6)

    Button(type: .submit) { "Send" }
}
```

### Input

```swift
Input(type: .text, name: "title", placeholder: "Enter title")
Input(type: .email, name: "email", placeholder: "you@example.com")
Input(type: .password, name: "password")
```

Bind to state with `value:`:

```swift
Input(type: .text, name: "title", placeholder: "Title", value: $input.title)
```

### TextArea

```swift
TextArea(name: "body", placeholder: "Write something...", rows: 6)
```

### Select and Option

```swift
Select(name: "topic") {
    Option(value: "general") { "General" }
    Option(value: "support") { "Support" }
    Option(value: "billing") { "Billing" }
}
```

### Label

```swift
Label(for: "email") { "Email address" }
```

## Media nodes

### Image

```swift
Image(src: "/assets/hero.jpg", alt: "Hero image")
    .size(width: .percent(100))
    .size(objectFit: .cover)
```

Images use lazy loading by default.

### Figure and FigureCaption

```swift
Figure {
    Image(src: "/assets/diagram.svg", alt: "Architecture diagram")
    FigureCaption { "System architecture overview" }
}
```

## Utility nodes

### HorizontalRule

```swift
HorizontalRule()
    .border(width: 1, color: .border, style: .solid)
```

## Control flow

Score uses native Swift control flow. No custom `ForEach`, `If`, or `Switch` components:

```swift
var body: some Node {
    for item in items {
        ItemCard(item: item)
    }

    if isLoggedIn {
        ProfileMenu()
    } else {
        Link(to: "/login") { "Sign in" }
    }

    switch status {
    case .active: Badge("Active")
    case .inactive: Badge("Inactive")
    }
}
```

## @NodeBuilder

The `@NodeBuilder` result builder allows composing multiple nodes in a block. It supports `if/else`, `for` loops, `switch`, and optional expressions:

```swift
var body: some Node {
    Heading(.one) { "Title" }
    Paragraph { "First paragraph." }
    Paragraph { "Second paragraph." }
}
```

This is what powers the `body` property on pages and components.
