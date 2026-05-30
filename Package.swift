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
        .package(url: "https://github.com/Reality2713/SwiftUsd-binaries.git", exact: "0.3.126-macos-arm64.2"),
    ],
    targets: [
        .binaryTarget(
            name: "SwiftUsdShell",
            url: "https://raw.githubusercontent.com/Reality2713/SwiftUsdShell-binaries/0.3.126-macos-arm64.2/Artifacts/v0.3.126-macos-arm64.2/SwiftUsdShell-0.3.126-macos-arm64.2.xcframework.zip",
            checksum: "d4110c0a1b076be091b6c0550512bb71aadb1805ffba7ea5f2969368680f8977"
        ),
        .binaryTarget(
            name: "SwiftUsdShellOpenUSD",
            url: "https://raw.githubusercontent.com/Reality2713/SwiftUsdShell-binaries/0.3.126-macos-arm64.2/Artifacts/v0.3.126-macos-arm64.2/SwiftUsdShellOpenUSD-0.3.126-macos-arm64.2.xcframework.zip",
            checksum: "1925859bd409d6b903329552a8fc41b1e7b9997a18f0a3e76bd5a058b78c268e"
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
