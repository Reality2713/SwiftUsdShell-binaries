// swift-tools-version: 6.2
import PackageDescription

let package = Package(
    name: "SwiftUsdShell",
    platforms: [
        .macOS(.v15),
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
        .package(url: "https://github.com/Reality2713/SwiftUsd-binaries.git", exact: "0.3.127-macos-arm64.1"),
    ],
    targets: [
        .binaryTarget(
            name: "SwiftUsdShell",
            url: "https://raw.githubusercontent.com/Reality2713/SwiftUsdShell-binaries/v0.3.127-macos-arm64.1/Artifacts/v0.3.127-macos-arm64.1/SwiftUsdShell-0.3.127-macos-arm64.1.xcframework.zip",
            checksum: "8ba4f30e55ad4a5353c008d6d09bdc865b6ff2cb5618712a83d986f4b9cc9469"
        ),
        .binaryTarget(
            name: "SwiftUsdShellOpenUSD",
            url: "https://raw.githubusercontent.com/Reality2713/SwiftUsdShell-binaries/v0.3.127-macos-arm64.1/Artifacts/v0.3.127-macos-arm64.1/SwiftUsdShellOpenUSD-0.3.127-macos-arm64.1.xcframework.zip",
            checksum: "681a4428e9586fed417f74ac2a933c89d0151cb1f8c3db5d266298b3bc190f7d"
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
