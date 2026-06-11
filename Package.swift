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
        .package(url: "https://github.com/Reality2713/SwiftUsd-binaries.git", exact: "0.3.134-macos-arm64.4"),
    ],
    targets: [
        .binaryTarget(
            name: "SwiftUsdShell",
            url: "https://raw.githubusercontent.com/Reality2713/SwiftUsdShell-binaries/v0.3.134-macos-arm64.4/Artifacts/v0.3.134-macos-arm64.4/SwiftUsdShell-0.3.134-macos-arm64.4.xcframework.zip",
            checksum: "6152f2c2e4d8e656e0824386ec5bf0dacd33aa2ac43f27eb5d385e85cf9220ea"
        ),
        .binaryTarget(
            name: "SwiftUsdShellOpenUSD",
            url: "https://raw.githubusercontent.com/Reality2713/SwiftUsdShell-binaries/v0.3.134-macos-arm64.4/Artifacts/v0.3.134-macos-arm64.4/SwiftUsdShellOpenUSD-0.3.134-macos-arm64.4.xcframework.zip",
            checksum: "7f739233f7c471ef28a14240670e71639fc4b0bcdb8d4192cf70010264619140"
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
