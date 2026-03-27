# Site

allegro.systems marketing site — a Score web app for the Allegro platform's public-facing website.

## Architecture

- **Pages** — HomePage, ProductsPage, AboutPage, NotFoundPage
- **Pages/Products** — ScorePage, LibrettoPage, StagePage, ComposerPage
- **Pages/Docs** — DocsPage, ScoreDocsPages, StageDocsPage, ComposerDocsPage
- **Pages/Blog** — BlogPage, BlogPostPages
- **Components/Layout** — Layout (uses theme's AppLayout, AppHeader, AppFooter), SiteLogo, ComingSoonProductLayout
- **Components/Navigation** — MobileMenu, NavDropdown, ProductsDropdown, DocsDropdown (NavLink from allegro-theme)
- **Components/Cards** — ProductCardGrid
- **Components/UI** — ProductPageTemplate (ProductPageHero, ProductPageFeature, ProductPageHighlight), Counter, EmailCapture, DevToolsToggle
- **Components/Docs** — DocsSidebar, DocsPageNav, ComingSoonDocsPage
- **Components/Blog** — BlogPostEntry
- **Components/About** — AboutPrinciple, AvoidItem
- **Extensions** — DateFormatting, DocsPathHelper
- **Dependencies** — Score framework, allegro-theme plugin, score-lucide, score-oauth

## Score Rules

This is a Score app. All code must follow Score conventions:

- **Never use inline JS or CSS** — no `htmlAttribute("style", ...)`, no `htmlAttribute("onclick", ...)`, no `RawTextNode("<style>...")`.
- **Use Score modifiers** for all styling (`.flex()`, `.font()`, `.background()`, etc.)
- **Use `@State`/`@Action`** for interactivity.
- **`RawTextNode("<script>...")`** is only acceptable when marked with `// SCORE-GAP:` for features the framework doesn't support yet (client-side fetch, timers, polling).
- **Components** must be `UpperCamelCase` `@Component struct` definitions.

## allegro-theme Components

Shared UI from the `allegro-theme` plugin is available:
- Layout: `AppHeader`, `AppFooter`, `AppLayout`
- Cards: `FeatureCard`, `ProductCard`, `DocCard`
- Links: `ActionLink`
- Primitives: `Badge`, `ProductPill`, `Divider`, `SectionLabel`, `PageHero`
- Navigation: `NavLink`, `ThemeToggle`, `LanguageDropdown`
- Errors: `ThemeErrorPage`

## Localization

This app is fully localized using Score's i18n system:

- **String catalog:** `Localizable.xcstrings` — Xcode String Catalog format (JSON). Source language is `en`.
- **Supported languages:** English, Spanish, German, French, Italian, Russian.
- **Loading:** `App.swift` loads the catalog via `Localization(catalog: StringCatalog.load(from: "Localizable.xcstrings"))`.
- **Usage in components:** Use `Localized("key")` to emit a translated `Node`, or `t("key")` to get a translated `String` for component props.
- **Routing:** Default locale (`en`) renders at `/`, others render at `/<locale>/` (e.g. `/fr/about`).
- **Language switcher:** `LanguageDropdown` from allegro-theme reads supported locales from the string catalog automatically — no hardcoded locale list.
- **Adding a language:** Add translations to `Localizable.xcstrings` under a new locale key. The dropdown and routing pick it up automatically.
- **Adding a string:** Add the key to `Localizable.xcstrings` with translations for all supported locales, then use `Localized("key")` or `t("key")` in your component.

## Development

```bash
swift run score dev  # Dev server with hot reload
swift run score build  # Production build
```

## Tooling

- Swift 6.3, `swift format` with shared `.swift-format` config
- `hk.pkl` pre-commit hooks: format, build
- `mise.toml` for task definitions
- Commit messages: `feat:`, `fix:`, `refactor:`, `chore:`, `test:`
