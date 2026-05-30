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
        .package(url: "https://github.com/Reality2713/SwiftUsd-binaries.git", exact: "0.3.126-macos-arm64.3"),
    ],
    targets: [
        .binaryTarget(
            name: "SwiftUsdShell",
            url: "https://raw.githubusercontent.com/Reality2713/SwiftUsdShell-binaries/0.3.126-macos-arm64.3/Artifacts/v0.3.126-macos-arm64.3/SwiftUsdShell-0.3.126-macos-arm64.3.xcframework.zip",
            checksum: "51eb3e362348b1f2b231b93ecc8a99faa88363243527dfe8779f454cf0576c45"
        ),
        .binaryTarget(
            name: "SwiftUsdShellOpenUSD",
            url: "https://raw.githubusercontent.com/Reality2713/SwiftUsdShell-binaries/0.3.126-macos-arm64.3/Artifacts/v0.3.126-macos-arm64.3/SwiftUsdShellOpenUSD-0.3.126-macos-arm64.3.xcframework.zip",
            checksum: "d9b01e55e400e02dcbf49854092568073b16756be6dd47eff927f419bbdba131"
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
