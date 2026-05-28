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
        .package(name: "SwiftUsd", url: "https://github.com/Reality2713/SwiftUsd-binaries.git", .exact("0.3.125-macos-arm64.1")),
    ],
    targets: [
        .binaryTarget(
            name: "SwiftUsdShell",
            url: "https://raw.githubusercontent.com/Reality2713/SwiftUsdShell-binaries/0.3.125-macos-arm64.1/Artifacts/v0.3.125-macos-arm64.1/SwiftUsdShell-0.3.125-macos-arm64.1.xcframework.zip",
            checksum: "89c533b2adcf9a74d40bfa8993cc0e014727738518af4383dae4e58dc9b3266c"
        ),
        .binaryTarget(
            name: "SwiftUsdShellOpenUSD",
            url: "https://raw.githubusercontent.com/Reality2713/SwiftUsdShell-binaries/0.3.125-macos-arm64.1/Artifacts/v0.3.125-macos-arm64.1/SwiftUsdShellOpenUSD-0.3.125-macos-arm64.1.xcframework.zip",
            checksum: "5d5e3ce8dd46678259447a6fc8c2257663692b6cb719f651217ba49ade10937c"
        ),
    ]
)
