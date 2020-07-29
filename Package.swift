// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "Reg",
    platforms: [.macOS(.v10_10), .iOS(.v10), .tvOS(.v13), .watchOS(.v2)],
    products: [
        .library(
            name: "Reg",
            targets: ["Reg"]
        ),
    ],
    targets: [
        .target(
            name: "Reg",
            dependencies: []
        ),
        .testTarget(
            name: "RegTests",
            dependencies: ["Reg"]
        ),
    ]
)
