// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Reg",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
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
