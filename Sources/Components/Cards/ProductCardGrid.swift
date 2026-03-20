import Score

@Component
struct ProductCardGrid {
    var body: some Node {
        ProductCard(
            title: "Score",
            description: t("products.score.card_desc"),
            accentColor: .score,
            link: "/score"
        )
        ProductCard(
            title: "Stage",
            description: t("products.stage.card_desc"),
            accentColor: .stage,
            comingSoon: true
        )
        ProductCard(
            title: "Composer",
            description: t("products.composer.card_desc"),
            accentColor: .composer,
            comingSoon: true
        )
        ProductCard(
            title: "Libretto",
            description: t("products.libretto.card_desc"),
            accentColor: .libretto,
            comingSoon: true
        )
    }
}
