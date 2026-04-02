import Score

struct ProductPages: PageProvider {
    var pages: [any Page] {
        [
            ProductsPage(),
            ScorePage(),
            StagePage(),
            ComposerPage(),
            LibrettoPage(),
        ]
    }
}
