// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Book",
    platforms: [
        .macOS("12.0"), .iOS("15.0"), .tvOS("15.0"),
    ],
    products: [
        .library(
            name: "Book",
            targets: ["Book"]
        ),
    ],
    targets: [
        .target(
            name: "Book",
            dependencies: []
        ),
        .testTarget(
            name: "BookTests",
            dependencies: ["Book"]
        ),
    ]
)
