---
title: Building a Syntax Theme from OKLCH
category: Design
date: 2026-01-18
excerpt: Exploring perceptual color spaces to build a syntax highlighting palette that feels consistent across every language we support.
---

Most syntax themes are built by hand. A designer picks colors that look good together in one language, then discovers they clash in another. Keywords that pop in Swift might vanish in CSS. String literals that contrast well against a dark background might wash out against a light one.

We wanted to build Score's default syntax theme systematically — and OKLCH gave us the tools to do it.

## Why OKLCH

OKLCH is a perceptual color space. Unlike HSL, where "50% lightness" produces wildly different perceived brightness depending on the hue, OKLCH's lightness channel maps directly to how bright a color appears to the human eye.

This property is exactly what you need for a syntax theme. When you assign a lightness value to "keywords" and a different one to "strings," you're making a perceptual guarantee: keywords will always be darker (or lighter) than strings, regardless of their hue.

## The design constraints

We started with a set of constraints:

- **Minimum contrast ratio** of 4.5:1 against the background for every token category
- **Distinct hues** for each semantic category (keyword, string, comment, type, function, number)
- **Consistent lightness** within a category across both light and dark modes
- **Chroma modulation** to avoid oversaturation — comments should feel muted, strings should feel warm

## Building the palette

The process was iterative but principled:

1. Choose a background lightness for each mode (L=0.15 for dark, L=0.98 for light)
2. Set a base lightness for code tokens that guarantees contrast (L=0.75 for dark, L=0.40 for light)
3. Assign hues by semantic role: blue for keywords, green for strings, orange for numbers, purple for types
4. Adjust chroma per category — comments at C=0.02, strings at C=0.12, keywords at C=0.10
5. Verify contrast ratios programmatically for every token-background pair

The result is a palette where every color has been chosen for its perceptual properties, not just its hex value.

## Mapping tokens to colors

Score's `SyntaxHighlighter` classifies tokens into categories: `keyword`, `string`, `comment`, `number`, `type`, `function`, `operator`, `variable`, and `plain`. Each category maps to a single color in the theme.

```swift
SyntaxTheme(
    keyword: Color.oklch(l: 0.75, c: 0.10, h: 250),
    string: Color.oklch(l: 0.72, c: 0.12, h: 150),
    comment: Color.oklch(l: 0.55, c: 0.02, h: 220),
    number: Color.oklch(l: 0.73, c: 0.11, h: 60),
    type: Color.oklch(l: 0.74, c: 0.09, h: 300),
    function: Color.oklch(l: 0.76, c: 0.08, h: 200),
    // ...
)
```

Because the lightness values are perceptually uniform, the visual hierarchy holds across every language the highlighter supports.

## Lessons learned

The biggest insight was that systematic doesn't mean mechanical. We still made subjective adjustments — slightly warmer strings, slightly cooler keywords — but every adjustment was made within the perceptual framework. When you know the rules, you can break them intentionally rather than accidentally.
