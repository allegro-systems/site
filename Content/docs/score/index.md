---
title: Getting Started
order: 1
section: Overview
---

Score is a Swift framework for building websites using a declarative, type-safe DSL. It compiles to static HTML, CSS, and minimal JavaScript — no virtual DOM, no runtime framework, no hydration step.

## Create a new project

Create a new project from the Score template using the GitHub CLI:

```
gh repo create my-site --template allegro-systems/score-template --private --clone
cd my-site
swift run score dev
```

This gives you a complete project with a homepage, theme, counter component, CRUD example, and dev server — ready to edit.

You can also add Score to an existing project manually:

```swift
// Package.swift
dependencies: [
    .package(url: "https://github.com/allegro-systems/score", from: "0.1.0")
]
```

## What you get

The template includes:

- **App.swift** — Application entry point with theme, metadata, and page registration
- **Theme.swift** — Custom theme with color roles, font families, and dark mode
- **HomePage.swift** — A page with a hero section, counter component, and CRUD example
- **Counter.swift** — A reactive `@Component` with `@State` and `@Action`
- **ItemsController.swift** — A JSON API controller demonstrating `@Route` handlers
- **Localizable.xcstrings** — String catalog for multi-language support

## Build and preview

```
swift run score dev      # Start dev server with hot reload
swift run score build    # Build for production → .score/
```

The dev command watches for file changes and rebuilds automatically. The build command compiles your Swift code and emits static HTML, CSS, and JavaScript to the `.score` directory.

## Project structure

A typical Score project looks like this:

```
MySite/
├── Package.swift
├── Sources/
│   ├── App.swift          # Application entry point
│   ├── Theme.swift        # Theme configuration
│   ├── Pages/
│   │   ├── HomePage.swift
│   │   └── AboutPage.swift
│   ├── Components/
│   │   └── Header.swift
│   ├── Controllers/       # API routes (optional)
│   │   └── ItemsController.swift
│   └── Models/
│       └── Item.swift
├── Content/               # Markdown content (optional)
│   └── posts/
├── Resources/             # Static assets (optional)
│   └── images/
└── Localizable.xcstrings  # Translations (optional)
```

## Your first page

Pages are Swift structs with a `path` and a `body`:

```swift
struct HomePage: Page {
    static let path = "/"

    var body: some Node {
        Section {
            Heading(.one) { "Hello, Score" }
            Paragraph { "Your first page." }
        }
        .padding(40, at: .vertical)
    }
}
```

Register pages in your `App.swift`:

```swift
@main
struct MySite: Application {
    @PageBuilder
    var pages: [any Page] {
        HomePage()
    }
}
```

## Requirements

- Swift 6.3 or later
- macOS 14 or later
