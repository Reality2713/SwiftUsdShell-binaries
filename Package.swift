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
        .package(url: "https://github.com/Reality2713/SwiftUsd-binaries.git", exact: "0.3.128-ios-arm64.1"),
    ],
    targets: [
        .binaryTarget(
            name: "SwiftUsdShell",
            url: "https://raw.githubusercontent.com/Reality2713/SwiftUsdShell-binaries/v0.3.128-ios-arm64.1/Artifacts/v0.3.128-ios-arm64.1/SwiftUsdShell-0.3.128-ios-arm64.1.xcframework.zip",
            checksum: "0a826a9e5995dcb6ee3fcc01b64d34fe1076464582afbb596d2e5319daded879"
        ),
        .binaryTarget(
            name: "SwiftUsdShellOpenUSD",
            url: "https://raw.githubusercontent.com/Reality2713/SwiftUsdShell-binaries/v0.3.128-ios-arm64.1/Artifacts/v0.3.128-ios-arm64.1/SwiftUsdShellOpenUSD-0.3.128-ios-arm64.1.xcframework.zip",
            checksum: "a32ada9e6b4ab9c1f652a19e654afcab3ab2e90a6921b97d6258782fb7557235"
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
