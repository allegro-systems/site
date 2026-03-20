---
title: Why Static-First Delivery Matters
category: Architecture
date: 2026-03-08
excerpt: A look at how pre-rendered pages reduce latency, simplify infrastructure, and keep the bundle lean — without sacrificing interactivity where it counts.
---

Every request that hits a server adds latency. Every framework that ships a runtime adds weight. For most pages on most sites, none of that is necessary — the content is known ahead of time, and the best possible response is the one that was already built.

That's the core premise behind static-first delivery: render what you can at build time, and reserve runtime for the parts that genuinely need it.

## What static-first means in practice

Static-first doesn't mean static-only. It means the default mode of delivery is a pre-rendered HTML document — complete, styled, and ready to paint — with no JavaScript required for the initial render.

When a page needs interactivity, Score's signal-based reactivity layer activates only for the components that require it. The rest of the page remains inert HTML. There's no hydration step, no framework bootstrap, and no diffing pass over a virtual DOM.

## The performance argument

Pre-rendered pages are fast because there's almost nothing standing between the CDN and the browser. No server-side rendering on every request. No waiting for a JavaScript bundle to parse and execute before the user sees content.

This matters most on constrained devices and slow connections — exactly the conditions where performance budgets are tightest and users are least patient.

## The infrastructure argument

Static output is trivially deployable. It doesn't require application servers, container orchestration, or autoscaling policies. A build step produces a directory of files; a CDN serves them. The operational surface area is as small as it can get.

When you do need server-side logic — form handlers, API routes, authentication — Score's controller system handles those requests through the same application. But the static pages don't depend on any of it.

## The correctness argument

Build-time rendering means build-time errors. If a page can't render, the build fails. There's no class of bug where a template works locally but breaks in production because of a missing environment variable or a database timeout.

The output is deterministic. The same source produces the same HTML every time.

## Where interactivity fits

Score doesn't eliminate client-side code — it limits it to where it's needed. A counter, a theme toggle, a search input: these get reactive bindings and the minimal JavaScript to drive them. Everything else is static markup.

The boundary between static and interactive is explicit in the code. There's no guessing about which components ship JavaScript and which don't. If a component uses `@State`, it's interactive. If it doesn't, it's static. The framework handles the rest.
