---
title: Content
order: 7
section: Content
---

Score's content system generates pages from Markdown files with YAML front matter. Use it for blogs, documentation, and any structured content.

## Content directory

Place Markdown files in a `Content/` directory:

```
Content/
├── posts/
│   ├── hello-world.md
│   └── getting-started.md
└── docs/
    ├── index.md
    └── pages.md
```

Each `.md` file becomes a content item. The filename (without extension) becomes the URL slug.

## Front matter

Content files use YAML front matter delimited by `---`:

```
---
title: Hello World
date: 2026-01-15
category: Engineering
tags: swift, score
order: 1
draft: false
---

Your markdown content goes here.
```

Access front matter values in code:

```swift
item.frontMatter?.string("title")     // "Hello World"
item.frontMatter?.string("date")      // "2026-01-15"
item.frontMatter?.bool("draft")       // false
item.frontMatter?.list("tags")        // ["swift", "score"]
item.frontMatter?.integer("order")    // 1
```

## ContentPage

Define a `ContentPage` to generate one page per Markdown file:

```swift
struct BlogPosts: ContentPage {
    static let content = "Content/posts"
    static let prefix = "/blog"

    var item: ContentCollection.Item

    var body: some Node {
        Article {
            Heading(.one) { item.frontMatter?.string("title") ?? "" }
                .font(.serif, size: 36, weight: .medium, color: .text)
            MarkdownNode(item.body)
        }
        .padding(40, at: .vertical)
        .size(maxWidth: 720)
    }
}
```

A file at `Content/posts/hello-world.md` generates a page at `/blog/hello-world`. A file named `index.md` maps to the prefix itself (`/blog`).

Register it alongside regular pages:

```swift
@PageBuilder
var pages: [any Page] {
    HomePage()
    BlogPage()
    BlogPosts()
}
```

`ContentPage` conforms to `PageProvider`, so it works directly in `@PageBuilder`.

## ContentCollection

Load and query content collections for listing pages or custom layouts:

```swift
let posts = ContentCollection(loading: "Content/posts")

// Sort by front matter field
let sorted = posts.sorted(by: "date", ascending: false)
let byOrder = posts.sorted(by: "order")

// Filter by category
let engineering = posts.filter { $0?.string("category") == "Engineering" }

// Get unique values
let categories = posts.uniqueValues(for: "category")
let tags = posts.uniqueTags(for: "tags")

// Look up by slug
let post = posts.item(slug: "hello-world")
```

Use a collection to build a listing page:

```swift
struct BlogPage: Page {
    static let path = "/blog"

    var body: some Node {
        let posts = ContentCollection(loading: "Content/posts")
            .sorted(by: "date", ascending: false)

        Section {
            Heading(.one) { "Blog" }
            for post in posts {
                Link(to: "/blog/\(post.slug)") {
                    Heading(.three) { post.frontMatter?.string("title") ?? "" }
                    Paragraph { post.frontMatter?.string("date") ?? "" }
                        .font(.mono, size: 13, color: .muted)
                }
            }
        }
        .flex(.column, gap: 24)
    }
}
```

## MarkdownNode

Render Markdown content as Score nodes:

```swift
MarkdownNode(item.body)
```

Supports:

- Headings (h1-h6)
- Paragraphs with inline formatting (bold, italic, code, links)
- Code blocks with syntax highlighting (Swift, HTML, CSS, JavaScript)
- Blockquotes
- Ordered and unordered lists
- Tables
- Images
- Horizontal rules
- Raw HTML blocks

## Code blocks

Fenced code blocks with a language identifier get syntax highlighting:

````
```swift
struct MyPage: Page {
    static let path = "/"
    var body: some Node { Text { "Hello" } }
}
```
````

Consecutive code blocks with `tab` in the info string are grouped into a tabbed interface:

````
```swift tab
let x = 42
```

```html tab
<div>42</div>
```
````

## Math expressions

Code blocks with the `math` info string render LaTeX as MathML:

````
```math
\frac{a}{b} + \sqrt{c}
```
````
