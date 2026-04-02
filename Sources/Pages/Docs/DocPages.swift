import Score

struct DocPages: PageProvider {
    var pages: [any Page] {
        [DocsPage(), StageDocsPage(), ComposerDocsPage()]
            + ScoreDocsPages().pages
    }
}
