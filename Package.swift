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
        .package(url: "https://github.com/Reality2713/SwiftUsd-binaries.git", exact: "0.3.134-macos-arm64.2"),
    ],
    targets: [
        .binaryTarget(
            name: "SwiftUsdShell",
            url: "https://raw.githubusercontent.com/Reality2713/SwiftUsdShell-binaries/v0.3.134-macos-arm64.1/Artifacts/v0.3.134-macos-arm64.1/SwiftUsdShell-0.3.134-macos-arm64.1.xcframework.zip",
            checksum: "8bcbb0eee2fcf000f61a10cf836a67a8c7213a5362e981a551263ed064fc55b7"
        ),
        .binaryTarget(
            name: "SwiftUsdShellOpenUSD",
            url: "https://raw.githubusercontent.com/Reality2713/SwiftUsdShell-binaries/v0.3.134-macos-arm64.1/Artifacts/v0.3.134-macos-arm64.1/SwiftUsdShellOpenUSD-0.3.134-macos-arm64.1.xcframework.zip",
            checksum: "102f1b325da545d4ef4aad62d73d6d9a19bd7b11d91afa8c35fa008739b2dc40"
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
