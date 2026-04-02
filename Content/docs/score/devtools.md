---
title: Dev Tools
order: 10
section: Tools
---

Score includes built-in development tools that activate automatically when running `score dev`. They provide component inspection, state debugging, and live editing.

## Inspector

Click the **Inspect** button on the dev tools pill (bottom-center of the page) to enter inspect mode. Hover over any element to see:

- **Component info** -- name, HTML tag, and breadcrumb path through the component tree
- **Styles** -- CSS properties applied to the element, with breakpoint-specific overrides grouped by name (compact, tablet, desktop)
- **Attributes** -- HTML attributes on the element
- **Bindings** -- reactive bindings including `@State` and `@Computed` values with their current state and scope
- **Actions** -- event handlers and `@Action` declarations

Click an element to select it and reveal its position in the Components panel.

## Panel

The expandable panel has two tabs:

**Components** -- a tree view of all Score components on the page. Stateful components are highlighted. Click a component to highlight it on the page. Source file links open your editor.

**State** -- lists all `@State`, `@Computed`, and `@Action` declarations across the page with live values, scopes, and persistence keys.

## Live editing

In development mode, text elements with source location metadata support inline editing. Double-click a text element to edit its content directly in the browser. Changes are written back to the Swift source file and the dev server triggers a rebuild automatically.

The edit system supports:

- **Text edits** -- replaces string literal content in the Swift source
- **Style edits** -- updates modifier parameter values near the source line

Edits post to `/_dev/edit`, which modifies the source file at the annotated location.

## Editor integration

Set the `SCORE_EDITOR` environment variable to configure which editor opens when you click source links:

```
SCORE_EDITOR=vscode score dev    # VS Code (default)
SCORE_EDITOR=subl score dev      # Sublime Text
SCORE_EDITOR=idea score dev      # IntelliJ / WebStorm
```

## Content editor

Score projects that use `ContentCollection` or `ContentPage` with file-based storage get a web-based content editor at `/_content`.

The editor allows editing:

- **Markdown content** -- body text and front matter fields for items in the `Content/` directory
- **Image assets** -- upload and replace images in the `Resources/` directory

### How it works

The editor reads and writes directly to your project's `Content/` and `Resources/` directories. Changes trigger a dev server rebuild. This means:

1. Edits are version-controlled -- they modify the same files committed to git
2. No external database required -- storage is the filesystem
3. Only available in development mode

### When it applies

The `/_content` editor is for projects where content is stored in Score's file-based formats (Markdown files in `Content/`, static assets in `Resources/`). If your content comes from an external database or API, the `/_content` path is not served.

### Disabling it

The content editor is enabled by default when a `Content/` directory exists. To disable:

```
score dev --no-content-editor
```
