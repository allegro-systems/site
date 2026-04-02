import Score

struct BlogPages: PageProvider {
    var pages: [any Page] {
        [BlogPage()] + BlogPostPages().pages
    }
}
