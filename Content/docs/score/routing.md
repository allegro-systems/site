---
title: Routing
order: 8
section: Core Concepts
---

Score uses a dual routing model: pages handle GET requests and produce HTML, controllers handle API endpoints with full HTTP method support.

## Page routing

Every page declares its URL with a static `path` property:

```swift
struct AboutPage: Page {
    static let path = "/about"
    var body: some Node { Heading(.one) { "About" } }
}
```

The route table is built automatically from registered pages. Pages always respond to GET requests with rendered HTML.

## Content page routing

`ContentPage` types generate routes from a directory of Markdown files:

```swift
struct DocsPages: ContentPage {
    static let content = "Content/docs"
    static let prefix = "/docs"
    var item: ContentCollection.Item
    var body: some Node { MarkdownNode(item.body) }
}
```

This generates `/docs/{slug}` for each file. An `index.md` file maps to `/docs` directly.

## Controllers

For API endpoints, use the `@Controller` and `@Route` macros:

```swift
@Controller("/api/items")
struct ItemsController {

    @Route(method: .get)
    func list(_ ctx: RequestContext) async throws -> Response {
        try .json(items)
    }

    @Route(method: .post)
    func create(_ ctx: RequestContext) async throws -> Response {
        guard let body = ctx.body,
            let input = try? JSONDecoder().decode(CreateInput.self, from: body)
        else {
            return .error("Invalid request body")
        }
        let item = Item(id: UUID(), title: input.title)
        return try .json(item, status: .created)
    }

    @Route(":id", method: .put)
    func update(_ ctx: RequestContext) async throws -> Response {
        guard let id = ctx.pathParameters["id"] else {
            return .error("Missing ID")
        }
        // update logic
        return .ok
    }

    @Route(":id", method: .delete)
    func delete(_ ctx: RequestContext) async throws -> Response {
        guard let id = ctx.pathParameters["id"] else {
            return .error("Missing ID")
        }
        // delete logic
        return .ok
    }
}
```

`@Controller` takes a base path. `@Route` takes an optional sub-path and HTTP method. The macros generate the protocol conformance and route table automatically.

Register controllers in your application:

```swift
var controllers: [any Controller] {
    [ItemsController()]
}
```

## Path parameters

Use `:param` syntax in route paths:

```swift
@Route(":id", method: .get)
func show(_ ctx: RequestContext) async throws -> Response {
    guard let id = ctx.pathParameters["id"] else {
        return .error("Missing ID")
    }
    // ...
}
```

Parameters are available on `ctx.pathParameters`.

## RequestContext

The `RequestContext` provides access to the incoming request:

- `ctx.body` -- request body as `Data?`
- `ctx.pathParameters` -- dictionary of path parameters
- `ctx.request` -- the underlying HTTP request

## Response helpers

Controllers return `Response` values. Built-in helpers:

```swift
.json(encodable)                  // JSON-encode a Codable value
.json(encodable, status: .created) // With custom status
.error("message")                 // Error response
.error("message", status: .notFound) // With custom status
.ok                               // 200 with empty body
.text("Hello")                    // Plain text
.html("<h1>Hello</h1>")           // HTML string
```

## Route priority

Routes resolve in this order:

1. **Exact page matches** -- static paths checked first
2. **Parameterized pages** -- paths with `:param` segments
3. **Controller routes** -- matched by path and HTTP method
4. **Error page** -- if no route matches
