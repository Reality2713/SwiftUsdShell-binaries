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
        .package(name: "SwiftUsd", url: "https://github.com/Reality2713/SwiftUsd-binaries.git", .exact("0.3.125-macos-arm64.2")),
    ],
    targets: [
        .binaryTarget(
            name: "SwiftUsdShell",
            url: "https://raw.githubusercontent.com/Reality2713/SwiftUsdShell-binaries/0.3.125-macos-arm64.2/Artifacts/v0.3.125-macos-arm64.2/SwiftUsdShell-0.3.125-macos-arm64.2.xcframework.zip",
            checksum: "bfd4de41d25cebee00236a3ee867ea6b93b6fae049ee433bc52ab9a7dc3496dc"
        ),
        .binaryTarget(
            name: "SwiftUsdShellOpenUSD",
            url: "https://raw.githubusercontent.com/Reality2713/SwiftUsdShell-binaries/0.3.125-macos-arm64.2/Artifacts/v0.3.125-macos-arm64.2/SwiftUsdShellOpenUSD-0.3.125-macos-arm64.2.xcframework.zip",
            checksum: "79d73d7b769524610b36ab99d7c27caa7b81495c5055e0520b195aa11292a0f5"
        ),
        .target(
            name: "_SwiftUsdShellOpenUSDLink",
            dependencies: [
                .product(name: "OpenUSD", package: "SwiftUsd"),
            ],
            swiftSettings: [.interoperabilityMode(.Cxx)]
        ),
    ]
)
