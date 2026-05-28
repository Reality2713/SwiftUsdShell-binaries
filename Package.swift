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
            ]
        ),
    ],
    dependencies: [
        .package(name: "SwiftUsd", url: "https://github.com/Reality2713/SwiftUsd-binaries.git", .exact("7.0.0-preflight.1")),
    ],
    targets: [
        .binaryTarget(
            name: "SwiftUsdShell",
            url: "https://raw.githubusercontent.com/Reality2713/SwiftUsdShell-binaries/0.3.124-macos-arm64.2/Artifacts/v0.3.124-macos-arm64.2/SwiftUsdShell-0.3.124-macos-arm64.2.xcframework.zip",
            checksum: "28ae8e24be6c3440d95d54e3a2ba3a83006a9ee4a2178a34073d46a945897f0c"
        ),
        .binaryTarget(
            name: "SwiftUsdShellOpenUSD",
            url: "https://raw.githubusercontent.com/Reality2713/SwiftUsdShell-binaries/0.3.124-macos-arm64.2/Artifacts/v0.3.124-macos-arm64.2/SwiftUsdShellOpenUSD-0.3.124-macos-arm64.2.xcframework.zip",
            checksum: "b62be333b92f0ef1af1e2bbeb91303bf349a6861874aad3d3b25e4cd6fb6746f"
        ),
    ]
)
