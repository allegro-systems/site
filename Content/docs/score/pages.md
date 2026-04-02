---
title: Pages
order: 2
section: Core Concepts
---

Pages are structs that conform to the `Page` protocol. Each page declares a URL path and a body.

## Defining a page

```swift
struct AboutPage: Page {
    static let path = "/about"

    var body: some Node {
        Section {
            Heading(.one) { "About Us" }
            Paragraph { "We build things." }
        }
        .padding(40, at: .vertical)
    }
}
```

`path` is the URL. `body` uses `@NodeBuilder` syntax -- you can return multiple nodes, use `if/else`, `for` loops, and `switch` directly.

## Registering pages

Pages go in your `Application` struct using `@PageBuilder`:

```swift
@main
struct MySite: Application {
    @PageBuilder
    var pages: [any Page] {
        HomePage()
        AboutPage()
        BlogPage()
    }
}
```

## Page metadata

Override the application-level metadata on a per-page basis:

```swift
struct AboutPage: Page {
    static let path = "/about"

    var metadata: (any Metadata)? {
        SiteMetadata(
            title: "About Us",
            description: "Learn about our team."
        )
    }

    var body: some Node {
        Heading(.one) { "About" }
    }
}
```

Application-level metadata is set the same way on your `Application` struct:

```swift
var metadata: (any Metadata)? {
    SiteMetadata(
        site: "My Site",
        title: "Home",
        description: "A Score web application."
    )
}
```

## Error pages

Define a custom error page with the `ErrorPage` protocol:

```swift
struct NotFoundPage: ErrorPage {
    var context: ErrorContext

    var body: some Node {
        Section {
            Heading(.one) { "404" }
            Paragraph { "Page not found." }
            Link(to: "/") { "Go home" }
        }
        .flex(.column, gap: 16, align: .center, justify: .center)
        .size(minHeight: 600)
    }
}
```

Register it in your application:

```swift
var errorPage: (any ErrorPage.Type)? { NotFoundPage.self }
```

The `ErrorContext` gives you access to the status code and request information.

## Page groups with PageProvider

As your app grows, organize related pages into groups using `PageProvider`:

```swift
struct ProductPages: PageProvider {
    var pages: [any Page] {
        [
            ProductsPage(),
            ScorePage(),
            StagePage(),
        ]
    }
}

struct BlogPages: PageProvider {
    var pages: [any Page] {
        [
            BlogPage(),
        ]
    }
}
```

Use them in your application just like individual pages -- `@PageBuilder` accepts both:

```swift
@PageBuilder
var pages: [any Page] {
    HomePage()
    AboutPage()
    ProductPages()
    BlogPages()
}
```

This keeps your `Application` struct clean as you add more pages.

## Content pages

For pages generated from Markdown files, use the `ContentPage` protocol. See the [Content](/docs/score/content) documentation for details.
