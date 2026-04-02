---
title: Modifiers
order: 5
section: Styling
---

Modifiers are chained method calls that style nodes. They emit scoped CSS at build time -- no runtime overhead, no style conflicts.

Score follows a **one modifier per CSS concept** rule. Layout is `.flex()`, typography is `.font()`, sizing is `.size()`. New CSS properties get added to the existing modifier rather than creating new ones.

## Layout

### Flex

```swift
// Flex container
.flex(.row, gap: 16, align: .center, justify: .spaceBetween)
.flex(.column, gap: 24)
.flex(.rowReverse, gap: 12, wraps: true)

// Flex item
.flex(grow: 1)
```

Directions: `.row`, `.column`, `.rowReverse`, `.columnReverse`.

### Grid

```swift
// Grid container
.grid(columns: 3, gap: 16)

// Grid item placement
.grid(column: .span(2), row: .line(1))
```

### Position

```swift
.position(.relative)
.position(.absolute, top: 0, trailing: 0)
.position(.sticky, top: 0)
```

### Display

```swift
.display(.none)
.display(.block)
.hidden()              // Shorthand for display none
```

### Z-index

```swift
.zIndex(100)
```

## Sizing

```swift
.size(width: 300, height: 200)
.size(maxWidth: 720)
.size(width: .percent(100))
.size(minHeight: .percent(100))
.size(width: 240, minHeight: .percent(100))

// For images
.size(objectFit: .cover)

// For textareas
.size(resize: .vertical)
```

## Spacing

### Padding

```swift
.padding(24)                       // All sides
.padding(24, at: .horizontal)
.padding(16, at: .vertical)
.padding(40, at: .top)
.padding(24, at: .bottom)
```

### Margin

```swift
.margin(0, at: .horizontal)       // Center a block element
.margin(24, at: .bottom)
```

## Typography

Everything goes in `.font()`:

```swift
// Family, size, weight, color
.font(.sans, size: 14, weight: .semibold, color: .text)
.font(.mono, size: 13, color: .muted)
.font(.serif, size: 32, weight: .light, color: .text)

// Style and line height
.font(.mono, size: 13, style: .italic, lineHeight: 1.6, color: .muted)

// Alignment
.font(.sans, size: 16, color: .text, align: .center)

// Tracking and transform
.font(.sans, size: 11, tracking: 2, transform: .uppercase)

// Word break and white space
.font(wordBreak: .breakWord, whiteSpace: .preWrap)

// Decoration
.font(decoration: .underline)
```

Weight options: `.light`, `.regular`, `.medium`, `.semibold`, `.bold`.

## Borders

```swift
// Full border
.border(width: 1, color: .border, style: .solid)
.border(width: 1, color: .border, style: .solid, radius: 8)

// Border on one side
.border(width: 1, color: .border, style: .solid, at: .bottom)

// Radius only
.border(radius: 8)
.border(radius: 9999)             // Pill shape
```

## Background

```swift
.background(.surface)
.background(.elevated)
.background(.accent)

// Gradient
.backgroundGradient(.radial(color: .accent, opacity: 0.04, width: 100, height: 60, at: .top))
```

## Visual

```swift
.opacity(0.85)
.cursor(.pointer)
.outline(width: 0)
.appearance(.none)                // Strip native browser styling (for form inputs)
```

### Shadow

```swift
.shadow(x: 0, y: 2, blur: 8, color: .border)
```

## Overflow

```swift
.overflow(vertical: .auto)
.overflow(horizontal: .hidden)
```

Score uses `horizontal`/`vertical` -- never `x`/`y`.

## Pseudo-classes

### Hover

```swift
.hover { $0.background(.elevated).font(color: .text) }
```

### Focus

```swift
.focus { $0.border(width: 2, color: .accent, style: .solid) }
```

## Pseudo-elements

### Placeholder

```swift
.placeholder { $0.font(color: .muted) }
```

### Selection

```swift
.selection { $0.background(.accent).font(color: .surface) }
```

## Responsive

Score provides breakpoint modifiers:

```swift
Heading(.one) { "Welcome" }
    .font(.serif, size: 56, weight: .light)
    .compact { $0.font(size: 32) }
```

- `.compact { }` -- small screens (mobile)
- `.tablet { }` -- medium screens
- `.desktop { }` -- large screens

Each modifier receives the current node and returns a modified version. Styles cascade from the base.

You can also hide elements at specific breakpoints:

```swift
.compact { $0.hidden() }
```

Or change layout direction:

```swift
.compact { $0.flex(.column, gap: 12) }
```

## Animation

```swift
.animate(.fadeIn)
.animate(.slideUp, duration: 0.5, onScroll: true)
.animate([.fadeIn, .slideUp], onScroll: true)
```

## Transitions

```swift
.transition(.opacity, duration: 0.2, timing: .easeOut)
```

## Chaining

Modifiers chain naturally. Order matters -- they apply left to right:

```swift
Text { "Hello" }
    .font(.mono, size: 14, color: .accent)
    .padding(8, at: .horizontal)
    .padding(4, at: .vertical)
    .background(.elevated)
    .border(radius: 4)
    .hover { $0.background(.accent).font(color: .surface) }
    .transition(.opacity, duration: 0.15, timing: .easeOut)
```
