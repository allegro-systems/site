---
title: Theming
order: 4
section: Styling
---

Score's theme system centralizes your design tokens in a single struct. Use the `@Theme` macro to define colors, fonts, and dark mode.

## Defining a theme

```swift
@Theme
struct AppTheme {
    var extraColorRoles: [String: ColorToken] {
        ["elevated": .oklch(0.96, 0.004, 240)]
    }

    var extraFontFamilies: [String: String] {
        ["brand": "'Inter', system-ui, sans-serif"]
    }

    var dark: (any ThemePatch)? { AppDarkPatch() }

    var named: [String: any ThemePatch] {
        ["dark": AppDarkPatch()]
    }
}
```

The `@Theme` macro generates `Theme` protocol conformance. Register it in your application:

```swift
var theme: (any Theme)? { AppTheme() }
```

## Color tokens

Colors use semantic roles. The built-in roles:

- `.text` -- primary text color
- `.surface` -- page and container backgrounds
- `.accent` -- interactive elements, links, highlights
- `.border` -- borders and dividers
- `.muted` -- secondary text, captions
- `.destructive` -- error states, delete actions
- `.success` -- success states, confirmations

Add custom color roles through `extraColorRoles`:

```swift
var extraColorRoles: [String: ColorToken] {
    [
        "elevated": .oklch(0.96, 0.004, 240),
        "dimmer": .oklch(0.85, 0.01, 240),
    ]
}
```

## #colorTokens macro

To use custom colors as static properties (`.elevated` instead of `ColorToken("elevated")`), use the `#colorTokens` macro:

```swift
extension ColorToken {
    #colorTokens("elevated", "dimmer", "brand")
}
```

This generates static properties so you can write:

```swift
.background(.elevated)
.font(color: .dimmer)
```

The `@Theme` macro automatically generates this extension in `Sources/Generated/ThemeColorTokens.swift` on each build, based on the keys in your `extraColorRoles`. You only need `#colorTokens` if you want to define them manually elsewhere.

## OKLCH color space

Score uses OKLCH as its primary color space. OKLCH provides perceptually uniform lightness -- colors at the same L value appear equally bright to the human eye.

```swift
// OKLCH: Lightness (0-1), Chroma (0-0.4), Hue (0-360)
.oklch(0.65, 0.15, 250)    // A blue
.oklch(0.65, 0.18, 145)    // A green at the same perceived brightness
.oklch(0.65, 0.18, 30)     // An orange at the same perceived brightness
```

You can also use OKLCH directly in modifiers without defining a theme role:

```swift
.font(color: .oklch(0.75, 0.15, 200))
.background(.oklch(0.98, 0.005, 240))
```

## Dark mode

Add dark mode with a `ThemePatch`:

```swift
struct AppDarkPatch: ThemePatch {
    var colorRoles: [String: ColorToken]? {
        [
            "surface": .oklch(0.17, 0.014, 240),
            "text": .oklch(0.93, 0.004, 240),
            "border": .oklch(0.26, 0.012, 240),
            "accent": .oklch(0.68, 0.13, 215),
            "muted": .oklch(0.58, 0.006, 240),
            "elevated": .oklch(0.22, 0.012, 240),
        ]
    }
}
```

Register the patch in your theme:

```swift
var dark: (any ThemePatch)? { AppDarkPatch() }
```

Score generates `prefers-color-scheme: dark` media queries for all overridden values. You only need to override the roles that change -- everything else inherits from the base theme.

## Named theme patches

Define additional named patches for manual switching:

```swift
var named: [String: any ThemePatch] {
    ["dark": AppDarkPatch()]
}
```

Toggle themes with persisted state:

```swift
@State(persisted: .theme) var isDark = false
@Action mutating func toggleTheme() { isDark.toggle() }
```

The `.theme` persistence key integrates with Score's theme switching system.

## Font families

Define font families that map to logical roles:

```swift
var extraFontFamilies: [String: String] {
    ["brand": "'Inter', system-ui, sans-serif"]
}
```

Use them in modifiers:

```swift
.font(.sans, size: 16)     // Uses the sans-serif family from your theme
.font(.mono, size: 14)     // Uses the monospace family
.font(.serif, size: 24)    // Uses the serif family
```

Score handles `@font-face` declarations and Google Fonts loading automatically.
