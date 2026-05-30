# SwiftUsdShell Binary Package

Binary SwiftPM package for SwiftUsdShell.

Current slice:

- macOS arm64 only
- Xcode 26.5 / Swift 6.2 line
- `0.3.126-macos-arm64.3`

`SwiftUsdShellOpenUSD` re-exports `SwiftUsdShell` (since `0.3.125-macos-arm64.3`),
so a consumer that imports `SwiftUsdShellOpenUSD` gets the contract types too —
a single import. See the `SwiftUsdShell` source repo README for the model.

This package depends on `SwiftUsd-binaries` for the binary `OpenUSD` product,
pinned in lockstep to the same slice version.
It is an iteration accelerator for first-party macOS Apple Silicon builds and
the first customer-shaped distribution slice.
