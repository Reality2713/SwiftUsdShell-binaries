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
        .package(url: "https://github.com/Reality2713/SwiftUsd-binaries.git", exact: "0.3.126-macos-arm64.1"),
    ],
    targets: [
        .binaryTarget(
            name: "SwiftUsdShell",
            url: "https://raw.githubusercontent.com/Reality2713/SwiftUsdShell-binaries/0.3.126-macos-arm64.1/Artifacts/v0.3.126-macos-arm64.1/SwiftUsdShell-0.3.126-macos-arm64.1.xcframework.zip",
            checksum: "0777e97ade037e2916e7e0420ce807c7545039b36cdf55b59531183ae3aa2d04"
        ),
        .binaryTarget(
            name: "SwiftUsdShellOpenUSD",
            url: "https://raw.githubusercontent.com/Reality2713/SwiftUsdShell-binaries/0.3.126-macos-arm64.1/Artifacts/v0.3.126-macos-arm64.1/SwiftUsdShellOpenUSD-0.3.126-macos-arm64.1.xcframework.zip",
            checksum: "3335d55923a7b5fc02d3acfedeff06875a5bea41cb356737ed45f9a9d7982001"
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
