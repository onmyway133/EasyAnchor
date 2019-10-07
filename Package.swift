// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Anchors",
    platforms: [
        .macOS(.v10_11),
        .iOS(.v9),
        .tvOS(.v9)
    ],
    products: [
        .library(
            name: "Anchors",
            targets: ["Anchors"]),
    ],
    targets: [
        .target(
            name: "Anchors",
            dependencies: []),
        .testTarget(
            name: "AnchorsTests",
            dependencies: ["Anchors"]),
    ],
    swiftLanguageVersions: [.v5]
)
