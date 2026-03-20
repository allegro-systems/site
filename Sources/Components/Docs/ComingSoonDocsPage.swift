import Score

@Component
struct ComingSoonDocsPage {
    let product: String
    let accentColor: ColorToken
    let pathPrefix: String
    let description: String

    var body: some Node {
        Stack {
            DocsSidebar(
                product: product,
                accentColor: accentColor,
                pathPrefix: pathPrefix
            )

            Stack {
                Heading(.one) { "\(product) Documentation" }
                    .font(.serif, size: 36, weight: .medium, lineHeight: 1.15, color: .text)
                    .compact { $0.font(size: 28) }
                    .padding(48, at: .top)
                    .padding(32, at: .bottom)

                Stack {
                    Text { "COMING SOON" }
                        .font(.mono, size: 11, weight: .medium, tracking: 3, color: accentColor)

                    Paragraph { description }
                        .font(.mono, size: 15, lineHeight: 1.8, color: .muted)

                    Link(to: "/\(product.lowercased())") {
                        Text { "\(product) product page \u{2192}" }
                            .font(.mono, size: 13, weight: .medium, color: accentColor)
                    }
                }
                .flex(.column, gap: 16)
                .padding(32)
                .background(.surface)
                .border(width: 1, color: .border, style: .solid)
            }
            .flex(.column)
            .padding(40, at: .vertical)
            .padding(56, at: .horizontal)
            .flexItem(grow: 1)
            .compact { $0.padding(20, at: .vertical).padding(20, at: .horizontal) }
        }
        .flex(.row)
    }
}
