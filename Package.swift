// swift-tools-version: 6.2
import PackageDescription

let package = Package(
    name: "SwiftUsdShell",
    platforms: [
        .iOS(.v26),
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
        .package(url: "https://github.com/Reality2713/SwiftUsd-binaries.git", exact: "0.3.133-ios-arm64.2"),
    ],
    targets: [
        .binaryTarget(
            name: "SwiftUsdShell",
            url: "https://raw.githubusercontent.com/Reality2713/SwiftUsdShell-binaries/v0.3.133-ios-arm64.2/Artifacts/v0.3.133-ios-arm64.2/SwiftUsdShell-0.3.133-ios-arm64.2.xcframework.zip",
            checksum: "bfab2e31b7283b500d093f22f507e88c5a6c71452bdea73002f1cd6d0b117c3a"
        ),
        .binaryTarget(
            name: "SwiftUsdShellOpenUSD",
            url: "https://raw.githubusercontent.com/Reality2713/SwiftUsdShell-binaries/v0.3.133-ios-arm64.2/Artifacts/v0.3.133-ios-arm64.2/SwiftUsdShellOpenUSD-0.3.133-ios-arm64.2.xcframework.zip",
            checksum: "68f0b46a2aa2d9840ea94a1af53884b87285f64c22ee97c3d93dae8f17ad892c"
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
