// swift-tools-version: 6.2
import PackageDescription

// Auto-generated binary release manifest for iOS and macOS Apple Silicon.
let package = Package(
    name: "SwiftUsdShell",
    platforms: [
        .iOS(.v26),
        .macOS(.v14),
    ],
    products: [
        .library(name: "SwiftUsdShell", targets: ["SwiftUsdShell"]),
        .library(
            name: "SwiftUsdShellOpenUSD",
            targets: [
                "SwiftUsdShell",
                "SwiftUsdShellOpenUSD",
                "_SwiftUsdShellOpenUSDLink",
            ]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/Reality2713/SwiftUsd-binaries.git", exact: "0.3.129-apple-arm64.1"),
    ],
    targets: [
        .binaryTarget(
            name: "SwiftUsdShell",
            url: "https://raw.githubusercontent.com/Reality2713/SwiftUsdShell-binaries/v0.3.129-apple-arm64.1/Artifacts/v0.3.129-apple-arm64.1/SwiftUsdShell-0.3.129-apple-arm64.1.xcframework.zip",
            checksum: "ddfa3cd3724a0d4f2514dfe41c511f8e112495f998eed108f63d00609c746fbd"
        ),
        .binaryTarget(
            name: "SwiftUsdShellOpenUSD",
            url: "https://raw.githubusercontent.com/Reality2713/SwiftUsdShell-binaries/v0.3.129-apple-arm64.1/Artifacts/v0.3.129-apple-arm64.1/SwiftUsdShellOpenUSD-0.3.129-apple-arm64.1.xcframework.zip",
            checksum: "e75f3e0e208cb4b6d1b44632c7f884b0e5e468de3a38a3ad28ef43256c2a5328"
        ),
        .target(
            name: "_SwiftUsdShellOpenUSDLink",
            dependencies: [
                .product(name: "OpenUSD", package: "SwiftUsd-binaries"),
            ],
            swiftSettings: [.interoperabilityMode(.Cxx)]
        ),
    ]
)
