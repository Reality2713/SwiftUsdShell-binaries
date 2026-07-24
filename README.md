# SwiftUsdShell binary package

This existing package publishes two deliberately separate surfaces:

- legacy `SwiftUsdShell` and `SwiftUsdShellOpenUSD` products for LTS consumers;
- `SwiftUsdShellRuntime`, the self-contained product-neutral runtime used by
  the OS 27 private engine libraries.

The `0.5.x` runtime line is produced only by the remote M5 workflow in
`Reality2713/SwiftUsd-binaries`. The package contains no engine source and owns
no product capability. Engine repositories depend on a compatible `0.5.x`
runtime range; app roots pin the exact patch tested by the binary release lock.

A toolchain-only patch updates this package without retagging unchanged
engines. Version-dependent runtime, plugins, and exact engine tags are still
tested together before publication.
