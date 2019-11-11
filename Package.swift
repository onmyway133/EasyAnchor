// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "EasyAnchor",
    platforms: [
        .macOS(.v10_11),
        .iOS(.v9),
        .tvOS(.v9)
    ],
    products: [
        .library(
            name: "EasyAnchor",
            targets: ["EasyAnchor"]),
    ],
    targets: [
        .target(
            name: "EasyAnchor",
            path: "Sources"
        ),
        .testTarget(
            name: "EasyAnchorTests",
            dependencies: ["EasyAnchor"]),
    ],
    swiftLanguageVersions: [.v5]
)
