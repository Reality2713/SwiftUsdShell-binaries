// swift-tools-version: 6.2
import PackageDescription

let package = Package(
    name: "SwiftUsdShell",
    platforms: [
        .iOS(.v26),
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
        .package(url: "https://github.com/Reality2713/SwiftUsd-binaries.git", exact: "0.3.133-ios-arm64.1"),
    ],
    targets: [
        .binaryTarget(
            name: "SwiftUsdShell",
            url: "https://raw.githubusercontent.com/Reality2713/SwiftUsdShell-binaries/v0.3.133-ios-arm64.1/Artifacts/v0.3.133-ios-arm64.1/SwiftUsdShell-0.3.133-ios-arm64.1.xcframework.zip",
            checksum: "a1d0b753b309b5ae623bbef0e388b9fb373f2c75baed9677043940d2ba6726a4"
        ),
        .binaryTarget(
            name: "SwiftUsdShellOpenUSD",
            url: "https://raw.githubusercontent.com/Reality2713/SwiftUsdShell-binaries/v0.3.133-ios-arm64.1/Artifacts/v0.3.133-ios-arm64.1/SwiftUsdShellOpenUSD-0.3.133-ios-arm64.1.xcframework.zip",
            checksum: "4b3f6ac10c89309171e5770e1a2c6a25ab5c5cbf34a155fe94cc63a4ad57aa78"
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
