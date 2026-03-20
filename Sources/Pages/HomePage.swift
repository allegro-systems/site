import Score

struct HomePage: Page {
    static let path = "/"

    var body: some Node {
        Layout {
            Section {
                Heading(.one) { Localized("home.hero.title") }
                    .font(.serif, size: 56, weight: .light, lineHeight: 1.15, color: .text, align: .center, wrap: .balance)
                    .size(maxWidth: 740)
                    .compact { $0.font(size: 36) }
                    .animate(.fadeIn, duration: 0.6)

                Paragraph { Localized("home.hero.subtitle") }
                    .font(.mono, size: 15, lineHeight: 1.6, color: .muted, align: .center)
                    .size(maxWidth: 580)
                    .compact { $0.font(size: 13) }
                    .animate(.fadeIn, duration: 0.6, delay: 0.15)

                Stack {
                    SiteButton(title: t("ui.get_started"), link: "http://dashboard.allegro.localhost", variant: .primary(.accent))
                        .htmlAttribute("id", "cta-dashboard")
                    SiteButton(title: t("ui.read_docs"), link: "/docs", variant: .secondary)
                    SiteButton(title: t("ui.view_on_github"), link: "https://github.com/allegro-systems", variant: .secondary, opensInNewTab: true)
                }
                .flex(.row, gap: 16, align: .center)
                .compact { $0.flex(.column, gap: 12).size(width: .percent(100)) }
                .animate(.fadeIn, duration: 0.6, delay: 0.3)

                RawTextNode(dashboardCtaScript)
            }
            .flex(.column, gap: 28, align: .center)
            .padding(120, at: .vertical)
            .padding(56, at: .horizontal)
            .backgroundGradient(.radial(color: .accent, opacity: 0.04, width: 120, height: 80, at: .top))
            .compact { $0.padding(80, at: .vertical).padding(20, at: .horizontal) }

            Divider()

            Section {
                SectionLabel(title: t("home.products"))
                    .animateOnScroll(.fadeIn)

                Stack {
                    ProductCardGrid()
                }
                .grid(columns: 2, gap: 20)
                .desktop { $0.grid(columns: 4, gap: 20) }
                .compact { $0.grid(columns: 1, gap: 16) }
                .animateOnScroll(.slideUp, duration: 0.5)
            }
            .flex(.column, gap: 40)
            .padding(80, at: .vertical)
            .padding(56, at: .horizontal)
            .compact { $0.padding(60, at: .vertical).padding(20, at: .horizontal) }

            Divider()

            Section {
                SectionLabel(title: t("home.why_allegro"))
                    .animateOnScroll(.fadeIn)

                Stack {
                    FeatureCard(
                        icon: "zap",
                        title: t("home.feature.swift_first"),
                        description: t("home.feature.swift_first.desc")
                    )
                    FeatureCard(
                        icon: "layers",
                        title: t("home.feature.integrated"),
                        description: t("home.feature.integrated.desc")
                    )
                    FeatureCard(
                        icon: "book-open",
                        title: t("home.feature.open"),
                        description: t("home.feature.open.desc")
                    )
                }
                .grid(columns: 3, gap: 20)
                .tablet { $0.grid(columns: 2, gap: 20) }
                .compact { $0.grid(columns: 1, gap: 16) }
                .animateOnScroll(.slideUp, duration: 0.5)
            }
            .flex(.column, gap: 40)
            .padding(80, at: .vertical)
            .padding(56, at: .horizontal)
            .compact { $0.padding(60, at: .vertical).padding(20, at: .horizontal) }

            Section {
                SectionLabel(title: t("home.docs"))
                    .animateOnScroll(.fadeIn)

                Stack {
                    DocCard(
                        title: t("home.docs.score"),
                        description: t("home.docs.score.desc"),
                        accentColor: .score,
                        link: "/docs/score"
                    )
                    DocCard(
                        title: t("home.docs.stage"),
                        description: t("home.docs.stage.desc"),
                        accentColor: .stage,
                        comingSoon: true
                    )
                    DocCard(
                        title: t("home.docs.composer"),
                        description: t("home.docs.composer.desc"),
                        accentColor: .composer,
                        comingSoon: true
                    )
                }
                .grid(columns: 3, gap: 20)
                .tablet { $0.grid(columns: 2, gap: 20) }
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

private let dashboardCtaScript = """
<script>
(function() {
  var btn = document.getElementById('cta-dashboard');
  if (!btn) return;
  var link = btn.querySelector('a') || btn;
  if (document.cookie.indexOf('session=') !== -1) {
    link.textContent = 'Dashboard';
  }
})();
</script>
"""
