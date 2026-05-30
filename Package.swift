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
        .package(url: "https://github.com/Reality2713/SwiftUsd-binaries.git", exact: "0.3.125-macos-arm64.3"),
    ],
    targets: [
        .binaryTarget(
            name: "SwiftUsdShell",
            url: "https://raw.githubusercontent.com/Reality2713/SwiftUsdShell-binaries/0.3.125-macos-arm64.3/Artifacts/v0.3.125-macos-arm64.3/SwiftUsdShell-0.3.125-macos-arm64.3.xcframework.zip",
            checksum: "a939242c270df5fc1447c6524eda5860685d41d29060f889a1ec2dd1577e656a"
        ),
        .binaryTarget(
            name: "SwiftUsdShellOpenUSD",
            url: "https://raw.githubusercontent.com/Reality2713/SwiftUsdShell-binaries/0.3.125-macos-arm64.3/Artifacts/v0.3.125-macos-arm64.3/SwiftUsdShellOpenUSD-0.3.125-macos-arm64.3.xcframework.zip",
            checksum: "e5ab28609cfc2d3a4c398df1801112164cb1805ae7336e33e183702bf0967545"
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
