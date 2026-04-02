---
title: CLI
order: 9
section: Tools
---

The Score CLI provides commands for creating, developing, and building projects.

## Creating a project

The recommended way to start is with the GitHub CLI:

```
gh repo create my-site --template allegro-systems/score-template --private --clone
cd my-site
swift run score dev
```

This creates a private repo from the Score template with everything you need: `Package.swift`, a theme, a homepage, an example component, a CRUD controller, and localization support.

### score init

Alternatively, scaffold locally without creating a GitHub repo:

```
score init my-site
cd my-site
```

## score dev

Start a development server with hot reload:

```
score dev
```

The dev server:

- Compiles your project in debug mode
- Starts a local HTTP server (default port 8080)
- Watches `Sources/` and `Resources/` for file changes
- Rebuilds and restarts automatically on change
- Injects dev tools for component inspection and state debugging

Options:

- `--port <port>` -- server port (default: 8080)
- `--no-devtools` -- disable dev tools injection
- `--no-content-editor` -- disable the content editor at `/_content`

## score build

Build the site for production:

```
score build
```

Compiles in release mode and emits static output to the `.score` directory:

```
.score/
├── index.html
├── about/index.html
├── global.css
├── styles/
│   ├── shared.css
│   └── home.css
├── scripts/
│   ├── score.js
│   └── shared.js
└── assets/
    └── images/
```

CSS and JavaScript are chunked per-page with shared styles extracted automatically. Assets from `Resources/` are fingerprinted for cache busting and served from `/assets/`.

## Application configuration

Your `Application` struct controls output directories:

```swift
@main
struct MySite: Application {
    var outputDirectory: String { ".score" }       // Build output (default)
    var contentDirectory: String { "Content" }     // Markdown content
    var resourcesDirectory: String { "Resources" } // Static assets
}
```

## Using with mise

A typical `mise.toml` configuration:

```toml
[tools]
swift = "6.3"

[tasks.dev]
run = 'swift run score dev --port "${usage_port?}"'

[tasks.build]
run = 'swift run score build'

[tasks.clean]
run = '''
swift package clean
rm -rf .score
'''
```

Then:

```
mise run dev --port 3000
mise run build
mise run clean
```
