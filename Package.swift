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
        .package(url: "https://github.com/Reality2713/SwiftUsd-binaries.git", exact: "0.3.134-macos-arm64.11"),
    ],
    targets: [
        .binaryTarget(
            name: "SwiftUsdShell",
            url: "https://raw.githubusercontent.com/Reality2713/SwiftUsdShell-binaries/v0.3.134-macos-arm64.10/Artifacts/v0.3.134-macos-arm64.10/SwiftUsdShell-0.3.134-macos-arm64.10.xcframework.zip",
            checksum: "70d1ebe944538875161d46d764c83bae396d22040be960edbb6b8684c4da90cf"
        ),
        .binaryTarget(
            name: "SwiftUsdShellOpenUSD",
            url: "https://raw.githubusercontent.com/Reality2713/SwiftUsdShell-binaries/v0.3.134-macos-arm64.10/Artifacts/v0.3.134-macos-arm64.10/SwiftUsdShellOpenUSD-0.3.134-macos-arm64.10.xcframework.zip",
            checksum: "7759f706dfeaa9c3f82abd0cf65818bae2c0f1fe94d33a44a16255e66ef5f64d"
        ),
        .target(
            name: "_SwiftUsdShellOpenUSDLink",
            dependencies: [
                // The adapter XCFramework is prelinked with the OpenUSD Swift
                // overlay metadata required by C++ interop. Pull only compiler
                // interfaces, binding helpers, and native libraries here;
                // linking the full Swift archive again registers every private
                // overlay class twice at runtime.
                .product(name: "OpenUSDPrelinkedSupport", package: "SwiftUsd-binaries"),
            ],
            swiftSettings: [.interoperabilityMode(.Cxx)]
        ),
    ]
)
