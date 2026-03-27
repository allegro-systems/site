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

## Secrets

Secrets are managed with [fnox](https://fnox.jdx.dev/) using [Infisical](https://infisical.com) (EU region). Each developer authenticates via a Machine Identity — no shared keys.

### First-time setup

1. Get a **Client ID** and **Client Secret** from your Infisical org admin (or create a Machine Identity with Universal Auth in the [Infisical dashboard](https://eu.infisical.com))
2. Ensure the identity is added to the Allegro project with read access
3. Store your credentials in the macOS Keychain:

```bash
security add-generic-password -a "infisical-client-id" -s "fnox" -w "<your-client-id>" -U
security add-generic-password -a "infisical-client-secret" -s "fnox" -w "<your-client-secret>" -U
```

4. Verify:

```bash
mise install
fnox get GITHUB_CLIENT_ID
```

Secrets are defined in `fnox.toml` and loaded automatically into the environment via mise.

## Development

All tasks are managed via `mise` and can be analyzed by running `mise run {task} --help` to see the task's description and options.
