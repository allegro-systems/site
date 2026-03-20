---
title: How We Think About Dependencies
category: Engineering
date: 2025-12-30
excerpt: Our philosophy on third-party packages — when to reach for one, when to write our own, and why we keep the dependency graph shallow.
---

Every dependency is a bet. You're betting that someone else's code will continue to work, continue to be maintained, and continue to align with your project's direction. Sometimes that bet pays off. Sometimes it doesn't.

At Allegro, we keep the dependency graph shallow and intentional. Here's how we think about it.

## The cost of a dependency

A dependency isn't free just because it's open source. It carries costs:

- **Build time**: Every package adds compilation work. Transitive dependencies multiply this.
- **Update burden**: Security patches, breaking changes, and deprecations all require attention.
- **Debugging surface**: When something breaks inside a dependency, you're reading someone else's code under pressure.
- **Supply chain risk**: Every package you trust is a package whose maintainers you trust, along with everyone who has commit access.

These costs scale with the depth of your dependency tree. A package with zero dependencies is predictable. A package that pulls in thirty transitive dependencies is a liability.

## When we reach for a dependency

We use third-party packages when the alternative is worse:

- **Networking primitives** (Swift NIO): Building a correct, performant HTTP server from scratch isn't a reasonable use of time.
- **Argument parsing** (Swift Argument Parser): CLI parsing is well-defined, thoroughly tested, and not a differentiator for our product.
- **Markdown parsing** (Swift Markdown): The CommonMark spec is complex enough that a battle-tested parser is the right choice.

The pattern: we depend on packages that solve well-scoped, stable problems where correctness matters more than customization.

## When we write our own

We write our own when:

- **The problem is core to our product.** Score's rendering pipeline, CSS generation, and reactive system are the product. Depending on someone else's implementation would mean we can't evolve these systems freely.
- **The existing solutions are overweight.** Many packages solve a broader problem than we have. We'd rather write 200 lines of focused code than import 10,000 lines and use 5% of them.
- **The maintenance cost of the dependency exceeds the implementation cost.** If writing and maintaining the code ourselves is less work than tracking upstream changes, we write it ourselves.

## Keeping the graph shallow

Score's `Package.swift` lists its direct dependencies explicitly. Each one is there for a reason we can articulate. We don't add dependencies speculatively, and we periodically audit the list to check whether each entry still earns its place.

Transitive dependencies are monitored too. When a direct dependency adds a new sub-dependency, we evaluate whether the expanded graph is still acceptable.

## The practical test

Before adding a dependency, we ask three questions:

1. **Can we write this in under a day?** If yes, we probably should.
2. **Is this package actively maintained with a clear governance model?** If not, we're inheriting risk.
3. **Does this package's dependency tree stay shallow?** If it pulls in a web of transitive dependencies, the cost may outweigh the benefit.

This isn't dependency-phobia. It's dependency-awareness. The goal is a codebase where every external dependency is a conscious choice, not an accident of convenience.
