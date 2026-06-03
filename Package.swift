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
        .package(url: "https://github.com/Reality2713/SwiftUsd-binaries.git", exact: "0.3.127-macos-arm64.2"),
    ],
    targets: [
        .binaryTarget(
            name: "SwiftUsdShell",
            url: "https://raw.githubusercontent.com/Reality2713/SwiftUsdShell-binaries/v0.3.127-macos-arm64.2/Artifacts/v0.3.127-macos-arm64.2/SwiftUsdShell-0.3.127-macos-arm64.2.xcframework.zip",
            checksum: "b81f5ec8d30ae2337555bde1cf9ca1496122dd81592ba48f40f19721f5652910"
        ),
        .binaryTarget(
            name: "SwiftUsdShellOpenUSD",
            url: "https://raw.githubusercontent.com/Reality2713/SwiftUsdShell-binaries/v0.3.127-macos-arm64.2/Artifacts/v0.3.127-macos-arm64.2/SwiftUsdShellOpenUSD-0.3.127-macos-arm64.2.xcframework.zip",
            checksum: "e1f6c55e95b526d08cf2ef54fe1c3244f5597c1ac366cf45aaec9d8df9cda8e2"
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
