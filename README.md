# Allegro Site

The marketing and documentation website for the [Allegro](https://allegro.systems) ecosystem — built entirely with Score.

## Overview

This site showcases the three Allegro products and hosts the full Score documentation:

- **Home** — product overview, feature highlights
- **Score** — declarative Swift web framework (landing + docs)
- **Stage** — hosting platform (landing)
- **Composer** — visual editor (landing)

The site itself serves as a real-world demonstration of Score's capabilities: pages, components, theming, API controllers, and static site generation — all written declaratively in Swift with zero raw HTML, CSS, or JavaScript.

## Project Structure

```
Sources/
├── App.swift                 # Application entry point — pages, theme, controllers
├── AllegroTheme.swift        # Theme configuration (fonts, colors, spacing)
├── Pages/
│   └── Docs/                 # Score documentation pages
├── Components/
│   ├── Layout/               # Master layout, navigation, footer
│   ├── Features/             # Product cards, feature grids, hero, buttons
│   └── Docs/                 # Documentation layout, sidebar, code examples
├── Controllers/              # API endpoint handlers
Content/                      # Markdown content with YAML front matter
```

## Requirements

- Swift 6.2+
- macOS 14+
- The [Score](../score) framework (referenced as a local package dependency)

## Quick Start

### New project

```bash
score init my-site
cd my-site
score dev
```

### Existing project

Add Score to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/allegro-systems/score", from: "0.1.0")
],
targets: [
    .executableTarget(
        name: "MySite",
        dependencies: [
            .product(name: "ScoreRuntime", package: "Score"),
            .product(name: "ScoreContent", package: "Score"),
        ]
    )
]
```

## Building & Running

### Score CLI (recommended)

The Score CLI provides a development server with hot reload and production builds.

```bash
score dev                  # Start dev server on port 8080
score dev --port 3000      # Custom port
score dev --no-devtools    # Disable dev tools overlay
```

```bash
score build                # Production build
```

The dev server watches `Sources/` and `Content/` for changes and automatically rebuilds. Dev tools are injected by default, providing source-map overlays and click-to-open-in-editor support.

### Swift directly

```bash
swift build
swift run
```

The rendered site is output to `.build/score/`.

## Formatting

```bash
make format
make lint
```
