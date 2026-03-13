import Score

struct AllegroTheme: Theme {

    private static let _colorRoles: [String: ColorToken] = [
        "surface": .oklch(1.0, 0, 0),
        "text": .oklch(0.15, 0.010, 70),
        "border": .oklch(0.88, 0.020, 75),
        "accent": .oklch(0.62, 0.12, 75),
        "muted": .oklch(0.58, 0.020, 70),
        "destructive": .oklch(0.55, 0.22, 25),
        "success": .oklch(0.60, 0.19, 145),
    ]

    private static let _customColorRoles: [String: [Int: ColorToken]] = [
        "bg": [500: .oklch(0.98, 0.005, 80)],
        "elevated": [500: .oklch(0.96, 0.012, 80)],
        "dimmer": [500: .oklch(0.80, 0.018, 75)],
        "score": [500: .oklch(0.50, 0.10, 240)],
        "stage": [500: .oklch(0.48, 0.16, 350)],
        "composer": [500: .oklch(0.55, 0.14, 155)],
        "libretto": [500: .oklch(0.62, 0.12, 75)],
        "sun": [500: .oklch(0.62, 0.12, 75)],
        "moon": [500: .oklch(0.58, 0.020, 70)],
    ]

    private static let _fontFamilies: [String: String] = [
        "sans": "'Inter', system-ui, -apple-system, sans-serif",
        "serif": "'Fraunces', serif",
        "mono": "'DM Mono', ui-monospace, monospace",
    ]

    private static let _fontImports: [String] = [
        "https://fonts.googleapis.com/css2?family=DM+Mono:ital,wght@0,300;0,400;0,500;1,300;1,400;1,500&display=swap",
        "https://fonts.googleapis.com/css2?family=Fraunces:ital,opsz,wght@0,9..144,100..900;1,9..144,100..900&display=swap",
        "https://unpkg.com/lucide-static@latest/font/lucide.css",
    ]

    private static let _darkPatch = AllegroDarkPatch()

    var colorRoles: [String: ColorToken] { Self._colorRoles }
    var customColorRoles: [String: [Int: ColorToken]] { Self._customColorRoles }
    var fontFamilies: [String: String] { Self._fontFamilies }
    var fontImports: [String] { Self._fontImports }

    var typeScaleBase: Double { 16 }
    var spacingUnit: Double { 4 }
    var radiusBase: Double { 8 }

    var dark: (any ThemePatch)? { Self._darkPatch }

    var named: [String: any ThemePatch] {
        ["dark": Self._darkPatch]
    }
}

struct AllegroDarkPatch: ThemePatch {

    private static let _colorRoles: [String: ColorToken] = [
        "surface": .oklch(0.145, 0.010, 75),
        "text": .oklch(0.915, 0.025, 83),
        "border": .oklch(0.235, 0.015, 70),
        "accent": .oklch(0.76, 0.095, 78),
        "muted": .oklch(0.53, 0.025, 72),
    ]

    private static let _customColorRoles: [String: [Int: ColorToken]] = [
        "bg": [500: .oklch(0.098, 0.006, 80)],
        "elevated": [500: .oklch(0.185, 0.014, 72)],
        "dimmer": [500: .oklch(0.305, 0.016, 70)],
        "score": [500: .oklch(0.68, 0.065, 240)],
        "stage": [500: .oklch(0.60, 0.115, 345)],
        "composer": [500: .oklch(0.76, 0.105, 152)],
        "libretto": [500: .oklch(0.76, 0.095, 78)],
        "sun": [500: .oklch(0.53, 0.025, 72)],
        "moon": [500: .oklch(0.76, 0.095, 78)],
    ]

    var colorRoles: [String: ColorToken]? { Self._colorRoles }
    var customColorRoles: [String: [Int: ColorToken]]? { Self._customColorRoles }
}
