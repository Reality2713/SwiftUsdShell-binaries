// swift-tools-version: 6.2
import PackageDescription

// The 0.5 series adds a self-contained, product-neutral Shell runtime for the
// private engine libraries. The existing products remain for legacy LTS apps.
let runtimeVersion = "0.5.0"
let runtimeArtifacts = [
    ("Alembic_xcframework", "Alembic", "1e334fdf1a19fd7765eb9ba7431edfdf4f44a3d6a715cede4640065a61ff7ffc"),
    ("Iex_xcframework", "Iex", "2801e6bc3937fa9c269363f4745d71176a210319897c6e4bb999334bf9d4b66c"),
    ("IlmThread_xcframework", "IlmThread", "a74b28090b5ecde723013cf4d75afa4343f9a43719608cb6b1329161a620b379"),
    ("Imath_xcframework", "Imath", "a6ee05073d9e98270008ce2d6be868289426aff3e5a491f3bdf59e639a73562b"),
    ("MaterialXCore_xcframework", "MaterialXCore", "78e22104c2c01bfed7ab1dc87bba3e51123899d7b9e4bec277a532f65e01591f"),
    ("MaterialXFormat_xcframework", "MaterialXFormat", "36529114adea7839d9acaf5b98c147b5d2cbece6c6d85d4572c4dcac63f7274e"),
    ("MaterialXGenGlsl_xcframework", "MaterialXGenGlsl", "fd7f6cafbd5f406f31d7f3ec9a32eb80ffcc2129530ab7ea9a5f08bcb68bd0e9"),
    ("MaterialXGenMsl_xcframework", "MaterialXGenMsl", "c09ebe744b8b1ba5ed790b32fd7b5d206d3f7803c2e861659a129aabb1bfc044"),
    ("MaterialXGenShader_xcframework", "MaterialXGenShader", "20c96e48b2251311df7626be3e3452f4033039748fc0b66914cd5f04c0d48924"),
    ("MaterialXRender_xcframework", "MaterialXRender", "5e4d9e984409f086f2ded5b81a1dee25ec0755cc897acf28dec2a312d49b17c1"),
    ("MaterialXRenderGlsl_xcframework", "MaterialXRenderGlsl", "3e67bce569fd611f643d58b2674a4b4c409a6e646d2f1bd0d98135c428715caa"),
    ("MaterialXRenderHw_xcframework", "MaterialXRenderHw", "33464cab0862373804cd44436ac7cf8a98448f704d32488b0a7c14d666048142"),
    ("OpenEXR_xcframework", "OpenEXR", "db1d9ba66b66940602fb345794307588170ad23208f6c5f3fd529a2dab96a60e"),
    ("OpenEXRCore_xcframework", "OpenEXRCore", "8f00421b9d832569dab2c16ba0bcaaa0ba29e839c97073ff2030c42c959527d9"),
    ("OpenEXRUtil_xcframework", "OpenEXRUtil", "a308e5c3b36e32e5d5b2f1a7c4559e59dad9a6895b549142ee19fcad0c75b562"),
    ("OpenVDB_xcframework", "OpenVDB", "58c5bedd5d66e98b826669650193b6190c0c1f92e7588222a763341b03da84cc"),
    ("OsdCPU_xcframework", "OsdCPU", "168f2e9a1748f6bb62e3bbfc5dd279afc24660cc23e6a596afe97236fe46857c"),
    ("OsdGPU_xcframework", "OsdGPU", "7167f969c3bb2514a9becec27ccaf5fbaba2d2384993c3999642dec8a3c13f70"),
    ("SwiftUsdShell_xcframework", "SwiftUsdShell", "59dc8084b3196e5126adf37c3c7826bc791c171e73b1d44f65fc6b8de5915526"),
    ("SwiftUsdShellOpenUSD_xcframework", "SwiftUsdShellOpenUSD", "47b79d47be9e5477c3430858fe7de6745a4b08c2d3ae864ce2e68565c6de0300"),
    ("TBB_xcframework", "TBB", "b3a78aca0f8f9825005c1bc88bb8ab6c01313671aed4e0b12bf981f19ff3fcc0"),
    ("Usd_Ar_xcframework", "Usd_Ar", "0b382b9552ed8df29209bc33de85871821f269e44318275d0fceebeb1f3c1288"),
    ("Usd_Arch_xcframework", "Usd_Arch", "6621b719e8e882e2173e9cf57abf7ba3f3d28a08e250ebadc1036eae31a67d46"),
    ("Usd_CameraUtil_xcframework", "Usd_CameraUtil", "d5dde583cd1fe7681794a999da225008ec5ea6a6f763bf6b85ea4d763917e920"),
    ("Usd_Ef_xcframework", "Usd_Ef", "7bba294c8bfd29f912db48fedbd10c870fccc2d698f6700cb84fb2a7934327e0"),
    ("Usd_Esf_xcframework", "Usd_Esf", "a87b0c272685e0963a9e1ef36a91b5a3c74735bedddb66985bf9e700137b3796"),
    ("Usd_EsfUsd_xcframework", "Usd_EsfUsd", "1571c7fa1abff6a1a6e585a22e65246f54aef1dd86c2ad5c8ad9516f5b227736"),
    ("Usd_Exec_xcframework", "Usd_Exec", "79c096454ffb0172dd7c855974a9bb9ade9585cc2c08ed825d171a74f8646f07"),
    ("Usd_ExecGeom_xcframework", "Usd_ExecGeom", "1b998724a44e14589aa26d7b254cf3b9d935de505fc21fa9c9e155808ee4bfa5"),
    ("Usd_ExecIr_xcframework", "Usd_ExecIr", "e6f83143c465a8d6923b4c9d9652937f548bb754bfc3c6c7fff168acac4be949"),
    ("Usd_ExecUsd_xcframework", "Usd_ExecUsd", "00fdd2ca95164004a0a17d273d24a05fdd8c2f928665c22271bd7453c288d1b7"),
    ("Usd_Garch_xcframework", "Usd_Garch", "6352a110e97535581b9f3ce1c367979385d08beae61b241ce0c81367aebd2346"),
    ("Usd_GeomUtil_xcframework", "Usd_GeomUtil", "712912c3ad7837d07a5dc182a7f5bacdd00831730eca3b445dd5a20d54f00c50"),
    ("Usd_Gf_xcframework", "Usd_Gf", "df670b8693b2db2520b64c5deddb0bab3f011d33e41ff2bfa60611e8f426bcc9"),
    ("Usd_Glf_xcframework", "Usd_Glf", "d78fae363021ef4df81dbeadd02062442b0a4cd2108e93c4d58ad8be00130372"),
    ("Usd_Hd_xcframework", "Usd_Hd", "40399b30e1582fa69a480081c5e9943bf3c1e9ed6728009bb82c723aa837b24a"),
    ("Usd_HdGp_xcframework", "Usd_HdGp", "548982a04c2d52dd92ed16c18127c55dd2d5509568a0758b55eef2488370220c"),
    ("Usd_HdMtlx_xcframework", "Usd_HdMtlx", "98f0bbc62f07c2b1a80f11b87ecf4227107fc97a76635590863f401076729d32"),
    ("Usd_HdSt_xcframework", "Usd_HdSt", "4b77741dd52185886fb3ef7f42808dc3f725666cfc36c912756e0b414efecb78"),
    ("Usd_Hdar_xcframework", "Usd_Hdar", "81211526da14b66ff2a1c63bc50baa718b2d475376b9cc53d6b6ecad121660e9"),
    ("Usd_Hdsi_xcframework", "Usd_Hdsi", "46944c9d4465bbc3ca3c6b39a7d054fa4a678240bdb770d9ec8165ef6fcd95e1"),
    ("Usd_Hdx_xcframework", "Usd_Hdx", "c389cd89987ab676094111b1bad41192ea5ca9fb54a1f0cb86d5595501e4c808"),
    ("Usd_Hf_xcframework", "Usd_Hf", "8fe9e38081f60abb4e286bde6cde49748c0f0c0bfcffdb3234bc10f9d118b12f"),
    ("Usd_Hgi_xcframework", "Usd_Hgi", "40051d7d4bbf39596c54800dd9aa1b958b4050bf1979887bb10743af6d0175c4"),
    ("Usd_HgiGL_xcframework", "Usd_HgiGL", "7375a213af4bfc5eda391c246150f5856f3893dc72841db271c61bdb4b125072"),
    ("Usd_HgiInterop_xcframework", "Usd_HgiInterop", "6b0bd57e8c1b6c1ce72691949451ff9e53f11eeea39e58c29b4b8a39b6929e57"),
    ("Usd_HgiMetal_xcframework", "Usd_HgiMetal", "f27b214ed8c2c3f30b4308c7dc00051dbabc3508f18b1f1307715fed6501879f"),
    ("Usd_Hio_xcframework", "Usd_Hio", "dc4b6b118b21ced81790dab592b251c2e05a48160557dbb64db541878f28589f"),
    ("Usd_HioOpenVDB_xcframework", "Usd_HioOpenVDB", "d45866474fe355bdf357cbe04706839d2a9b78e57387a4a021eec55f6f01a3ff"),
    ("Usd_Js_xcframework", "Usd_Js", "933eef79c860b91c328a114dd9833d7b9a2de7f1244ce9eb05485ec62532758e"),
    ("Usd_Kind_xcframework", "Usd_Kind", "775e4daa1d9d3dc97dcbf7a286cd75855747100262d6f67783b4d7da1f1238cf"),
    ("Usd_Pcp_xcframework", "Usd_Pcp", "057759c0a718e81c021b82088e3f3d89798dd73db3c9729b093ad98055e35c02"),
    ("Usd_Pegtl_xcframework", "Usd_Pegtl", "a04ff16791795a3b8efface5a82bf7eb6be62bdd45a2e9c5cf0bfd42bd390199"),
    ("Usd_Plug_xcframework", "Usd_Plug", "ed7457ee9dc8b5d48b67386502600cfb62abbdac1d2a59028fe28603357cb104"),
    ("Usd_PxOsd_xcframework", "Usd_PxOsd", "b77be21613218088e5eafdbd6bde48d6a2af41ffe90a1da492880964e704c680"),
    ("Usd_Sdf_xcframework", "Usd_Sdf", "1dc626766fbbf657eb1ddf12319bc665bacdf7c81a564299a34417942e799f74"),
    ("Usd_Sdr_xcframework", "Usd_Sdr", "abb65ca39e00a6aee53a85180fa8d3d736c9ac5ef8f6b7817799b6348ba5c0be"),
    ("Usd_Tf_xcframework", "Usd_Tf", "2bd14e7548542af95e4cfe5dc404891ad50b3f49de7d4fa43e7e81e844d68f1d"),
    ("Usd_Trace_xcframework", "Usd_Trace", "e1283fda4d41126af7509c79a96cf59a53b7abbfcb5bddaf32e4c05419f1b458"),
    ("Usd_Ts_xcframework", "Usd_Ts", "077b5767f7f9e81d515b2e8a884efee8147f36dcbdc48a3f3a277221ab00513d"),
    ("Usd_Usd_xcframework", "Usd_Usd", "60c3b4077c2385421c855fd56fb8e509416d3d63ef7140292796aef12d67ea48"),
    ("Usd_UsdAppUtils_xcframework", "Usd_UsdAppUtils", "2362bf079af4bfa4f9923d223554d5b7f2c8e23090488c469982273375efd703"),
    ("Usd_UsdBakeMtlx_xcframework", "Usd_UsdBakeMtlx", "d5bd25efa7c3b40b2cf66a33667e1d005b4886265055383ccbdad313d04f6b18"),
    ("Usd_UsdGeom_xcframework", "Usd_UsdGeom", "65ff4e603bb389ba2b493ea680d4e15a216d92adbb81e4f31c0fdc03cd1d920c"),
    ("Usd_UsdGeomValidators_xcframework", "Usd_UsdGeomValidators", "2df9890fc6d94cd970392cbe2b7e4fdf5972b62a04dad73ce9529922fbe804a6"),
    ("Usd_UsdHydra_xcframework", "Usd_UsdHydra", "7ebeef0b6dad2e235f25f681a27efb7bf104cf418db9b47b3eef97420266bfd2"),
    ("Usd_UsdImaging_xcframework", "Usd_UsdImaging", "3b8d507f245a481983db8731f3822fbefc4a62dbf09cafd0023eb71480c52cf4"),
    ("Usd_UsdImagingGL_xcframework", "Usd_UsdImagingGL", "42294082e1f7f91f779c563039d0eb9b0d05ab0097caa7828f73794ea40021cb"),
    ("Usd_UsdLux_xcframework", "Usd_UsdLux", "37ad964a7ca8b014aaaf02704594deac081cf1ff0be32b4d53914b665f68fce9"),
    ("Usd_UsdMedia_xcframework", "Usd_UsdMedia", "2a07ab7432c77da28cf4ac0c57ab3d5d158964c7d9e84b77a7a05b32124088a7"),
    ("Usd_UsdMtlx_xcframework", "Usd_UsdMtlx", "5e7100f10cb0a01a067d5dcaf9e51ca3a61a4c19e6debeb3d1474936db5f5ea2"),
    ("Usd_UsdPhysics_xcframework", "Usd_UsdPhysics", "c7b750fd63930f6b4574c7255230bd658ea6d0484c4c8b4e6037ae4b0ae1f88d"),
    ("Usd_UsdPhysicsValidators_xcframework", "Usd_UsdPhysicsValidators", "3e32dcdafc859d5eb4422e18b81cbeb30791e66d5e0b1932889c128cfc971663"),
    ("Usd_UsdProc_xcframework", "Usd_UsdProc", "5d2293ae718151f289e083ee24db85aa232c954b24109c94da408796da0bfb47"),
    ("Usd_UsdProcImaging_xcframework", "Usd_UsdProcImaging", "708e35ffc6e240a5d2a073ff5bc321f465df2fd9b69257cdfa64adc8f1f1466d"),
    ("Usd_UsdRender_xcframework", "Usd_UsdRender", "60cf8aec284caef1cc6aa9f00cb4bbd3d29d00b818a8607f8c579ac816191266"),
    ("Usd_UsdRi_xcframework", "Usd_UsdRi", "5b0d51e52eb24a36dbd3db7968c15435ace59c3d4c30e675fcb3a3c5be83477e"),
    ("Usd_UsdSemantics_xcframework", "Usd_UsdSemantics", "4582162a225b96b6a6a5afe4318e7af14179fc432bac951c31ad289b31d496b7"),
    ("Usd_UsdShade_xcframework", "Usd_UsdShade", "cabbf1b697f2dce2668b16ff6557f1c3141f7474f701a3984f7179b4b8913ab9"),
    ("Usd_UsdShadeValidators_xcframework", "Usd_UsdShadeValidators", "eeeb12f5da05b2f9fcca26ef93f45702931411f88b28cd04ba6563c9fedf142d"),
    ("Usd_UsdSkel_xcframework", "Usd_UsdSkel", "e1bebba5656140d854febabda8aec40d99c0fb4f102ea2d070084b4187e959f4"),
    ("Usd_UsdSkelImaging_xcframework", "Usd_UsdSkelImaging", "a1c8d9ef71b444036c9340dbdf8557c4bad6b130391778db71f1ff080f4c9551"),
    ("Usd_UsdSkelValidators_xcframework", "Usd_UsdSkelValidators", "9d9c3532cc3e2e4bb0bda93b4a0fa650d0a5d86b1dd5d55738e4ded30ba04376"),
    ("Usd_UsdUI_xcframework", "Usd_UsdUI", "5dc7801ace88c21d776434a9b8311d891ce0880fd4cc996892b65cd224983ccc"),
    ("Usd_UsdUtils_xcframework", "Usd_UsdUtils", "d2563a1d8a0e0a3fc782e48564b4b921b1ef31a39e476df7a1b95235b6eeefbd"),
    ("Usd_UsdUtilsValidators_xcframework", "Usd_UsdUtilsValidators", "f130b6aff272cc3c18846e11bdd6a470e08add8232fd4a2c5ea590f543ba2e5e"),
    ("Usd_UsdValidation_xcframework", "Usd_UsdValidation", "5f8eddb226d0345fc968ca4eb1c1dbbb572603733f17cd68e2e77938bbfbed6b"),
    ("Usd_UsdVol_xcframework", "Usd_UsdVol", "a99c623405d6cbb602dd339144a09b901076a5fcd4648a51541c0b41f1a8f735"),
    ("Usd_UsdVolImaging_xcframework", "Usd_UsdVolImaging", "56f7313a96357d9b4d4c52b2a4fe6c6c692316bee4bea89e00ccb6f7ac463a6c"),
    ("Usd_Vdf_xcframework", "Usd_Vdf", "fef74f108d642292db5cb2d0e63de58ee87a784f2b4d3ef17972306d35bea3c2"),
    ("Usd_Vt_xcframework", "Usd_Vt", "f2931518498ec0859d1c470dd5379e2f8e6104f4a4b10807b6acdfd5e2f3f201"),
    ("Usd_Work_xcframework", "Usd_Work", "20232a930717bc3a033d8f815243963fd8dbd792976464f49b46761d8f2ae831"),
    ("_OpenUSD_SwiftBindingHelpers_xcframework", "_OpenUSD_SwiftBindingHelpers", "a61b42acc9020c4919cb577aa265acbfab72f0ed46afda2af0ae0f8a08a16f6f"),
    ("blosc_xcframework", "blosc", "1915c6a5f5c709663372fe696369fc040bc71ab2e9734a73928bb64218629090"),
    ("boost_iostreams_xcframework", "boost_iostreams", "5e7b978df3c5e1ff16b9d940d8d4becc4000e5bf24eefda68ae9c02254663ba5"),
    ("embree4_xcframework", "embree4", "9a3ae935ca6e5f2ade2eda9b8f966483640f7bbfb71954b0bc3ce34572cb5ad7"),
    ("hdEmbree_xcframework", "hdEmbree", "f3039786d52798c37b5e30b882935749b362dec3f78c22d96a3f35057ec01cf1"),
    ("hdStorm_xcframework", "hdStorm", "f7df0859d7cfc12451e6bbfbf4320440fed164f4776b3e0e8230e7435cb8e742"),
    ("hioAvif_xcframework", "hioAvif", "380c2bf88df63682121ad18f9697b851dc3c4d442f9d129f06375a231233d1d0"),
    ("hioImageIO_xcframework", "hioImageIO", "d1a12453cc2322014ff80539b12a2436b974cca4755b36f14ab3935dc8da6369"),
    ("hioOpenEXR_xcframework", "hioOpenEXR", "650f6902eb8ee28c94fe3e0b201301c160646edde81956e4c73144233bd18685"),
    ("sdrGlslfx_xcframework", "sdrGlslfx", "17a4dc0eff9ba6897c4935bb20d324916cf12096eae24a531ae8aab46b3ce82f"),
    ("usdAbc_xcframework", "usdAbc", "c065e115b54ce6b34566b51d6061e96b73afa3e145690ee2889d65dbbc39f301"),
    ("usdShaders_xcframework", "usdShaders", "3eb1496174a2685c8e3c9dc0c271eacb07bf10186133c489a7c0fbddeb2e99fc"),
]
let runtimeTargetNames = runtimeArtifacts.map { "_SwiftUsdShellRuntime_\($0.0)" }
let runtimeBinaryTargets: [Target] = zip(runtimeArtifacts, runtimeTargetNames).map { artifact, targetName in
    .binaryTarget(
        name: targetName,
        url: "https://github.com/Reality2713/SwiftUsdShell-binaries/releases/download/v\(runtimeVersion)/\(artifact.1)-\(runtimeVersion).xcframework.zip",
        checksum: artifact.2
    )
}

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
        .library(
            name: "SwiftUsdShellRuntime",
            targets: runtimeTargetNames
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
                .product(name: "OpenUSDPrelinkedSupport", package: "SwiftUsd-binaries"),
            ],
            swiftSettings: [.interoperabilityMode(.Cxx)]
        ),
    ] + runtimeBinaryTargets
)
