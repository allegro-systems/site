import Score

struct ProductsPage: Page {
    static let path = "/products"

    var body: some Node {
        Layout {
            Section {
                Heading(.one) { Localized("products.title") }
                    .font(.serif, size: 56, weight: .light, lineHeight: 1.15, color: .text, align: .center, wrap: .balance)
                    .size(maxWidth: 740)
                    .compact { $0.font(size: 36) }
                    .animate(.fadeIn, duration: 0.6)

                Paragraph { Localized("products.subtitle") }
                    .font(.mono, size: 15, lineHeight: 1.6, color: .muted, align: .center)
                    .size(maxWidth: 640)
                    .compact { $0.font(size: 14) }
                    .animate(.fadeIn, duration: 0.6, delay: 0.15)
            }
            .flex(.column, gap: 24, align: .center)
            .padding(120, at: .vertical)
            .padding(56, at: .horizontal)
            .backgroundGradient(.radial(color: .accent, opacity: 0.04, width: 120, height: 80, at: .top))
            .compact { $0.padding(80, at: .vertical).padding(20, at: .horizontal) }

            Divider()

            Section {
                Stack {
                    ProductCardGrid()
                }
                .grid(columns: 2, gap: 20)
                .compact { $0.grid(columns: 1, gap: 16) }
                .animateOnScroll(.slideUp, duration: 0.5)
            }
            .flex(.column, gap: 40)
            .padding(80, at: .vertical)
            .padding(56, at: .horizontal)
            .compact { $0.padding(60, at: .vertical).padding(20, at: .horizontal) }

        }
    }
}
