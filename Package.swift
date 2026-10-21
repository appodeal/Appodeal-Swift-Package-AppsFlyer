// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "AppodealAppsFlyerAdapter",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "AppodealAppsFlyerAdapter",
            targets: ["AppodealAppsFlyerAdapterWrapper"]),
    ],
    dependencies: [
        .package(url: "https://github.com/appodeal/Appodeal-Swift-Package.git", .upToNextMajor(from: "4.0.0-alpha.1")),
        .package(url: "https://github.com/AppsFlyerSDK/AppsFlyerFramework-Static", exact: "6.18.0"),
        .package(url: "https://github.com/AppsFlyerSDK/appsflyer-apple-purchase-connector", exact: "6.18.1"),
    ],
    targets: [
        .target(
            name: "AppodealAppsFlyerAdapterWrapper",
            dependencies: [
                .product(name: "AppodealSDK", package: "Appodeal-Swift-Package"),
                .product(name: "AppsFlyerLib-Static", package: "AppsFlyerFramework-Static"),
                .product(name: "PurchaseConnector", package: "appsflyer-apple-purchase-connector"),
                .target(name: "AppodealAppsFlyerAdapter"),
            ],
            path: "Sources",
            sources: ["Exports.swift"]
        ),
        .binaryTarget(
            name: "AppodealAppsFlyerAdapter",
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/AppodealAppsFlyerAdapter/6.18.0.3/ab42d92894f1/AppodealAppsFlyerAdapter.xcframework.zip",
            checksum: "ab42d92894f1be43d9c62291a01816f1c2f287fd29dbf05f8f0e27c292a5bb89"
        ),

    ]
)
