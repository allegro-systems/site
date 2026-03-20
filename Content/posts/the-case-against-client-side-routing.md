---
title: The Case Against Client-Side Routing
category: Engineering
date: 2026-02-05
excerpt: Why we chose server-driven navigation over SPA-style routing — and how it changed the way we think about page transitions.
---

Single-page applications route on the client. They intercept link clicks, manipulate the history API, fetch data, and swap DOM nodes — all to avoid a full page load. The pitch is faster navigation. The cost is everything that comes with it.

Score takes a different approach: every navigation is a real page load. And it's fast enough that the tradeoff isn't worth making.

## What client-side routing actually costs

A client-side router is a parallel implementation of something the browser already does. You need route definitions, a matching algorithm, guards for authentication and authorization, scroll restoration, focus management, loading states, error boundaries, and code splitting to keep bundle sizes reasonable.

Each of these is a solved problem in the browser's native navigation model. By routing on the client, you're opting out of the browser's solutions and committing to maintaining your own.

## Why full page loads are fast enough

When pages are pre-rendered and served from a CDN, the response time for a navigation is the network round-trip plus the browser's paint time. For a typical Score page — a few kilobytes of HTML, a scoped stylesheet, and minimal or no JavaScript — that's well under 100ms on a reasonable connection.

The browser handles scroll position, focus management, and history state automatically. There's no loading spinner because there's no data fetch. The page arrives complete.

## View transitions for perceived smoothness

The View Transitions API gives you animated transitions between full page loads without any client-side routing infrastructure. Score's theme system supports declaring transition animations that the browser applies automatically during navigation.

This means you get the perceived smoothness of a SPA — crossfades, slide transitions, morphing elements — while keeping the simplicity of server-driven navigation.

## When you do need client-side state

Some interactions genuinely need client-side state: a search input with live results, a multi-step form, a drag-and-drop interface. Score handles these with component-level reactivity, not page-level routing.

The distinction matters. A reactive component manages its own state within a page. It doesn't intercept navigation, manipulate the URL, or take over the browser's back button. The scope of client-side behavior is bounded to the component that needs it.

## The simplicity argument

Server-driven navigation means your application has one source of truth for URLs: the server. There's no divergence between what the server can render and what the client can display. Deep links work. Bookmarks work. The back button works. Search engines see the same page users see.

This isn't a limitation — it's a feature. Every piece of complexity you don't ship is a piece of complexity you don't debug, don't maintain, and don't explain to the next person who reads your code.
