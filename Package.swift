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
        .package(url: "https://github.com/Reality2713/SwiftUsd-binaries.git", exact: "0.3.134-macos-arm64.8"),
    ],
    targets: [
        .binaryTarget(
            name: "SwiftUsdShell",
            url: "https://raw.githubusercontent.com/Reality2713/SwiftUsdShell-binaries/v0.3.134-macos-arm64.8/Artifacts/v0.3.134-macos-arm64.8/SwiftUsdShell-0.3.134-macos-arm64.8.xcframework.zip",
            checksum: "0f711da791736daad81cb8d10740919b26f620d644ab9b672aeb61f3f861c87e"
        ),
        .binaryTarget(
            name: "SwiftUsdShellOpenUSD",
            url: "https://raw.githubusercontent.com/Reality2713/SwiftUsdShell-binaries/v0.3.134-macos-arm64.8/Artifacts/v0.3.134-macos-arm64.8/SwiftUsdShellOpenUSD-0.3.134-macos-arm64.8.xcframework.zip",
            checksum: "5509afb42c686a5fc9c701574d846808b147e5368c950f9dc61386af71e3feb0"
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
