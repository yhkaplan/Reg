// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "Reg",
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
