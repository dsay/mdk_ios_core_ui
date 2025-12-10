// swift-tools-version:5.4

import PackageDescription

let package = Package(
    name: "mdk_ios_core_ui",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "Alert",
            targets: ["Alert"]),
        .library(
            name: "Coordinator",
            targets: ["Coordinator"]),
        .library(
            name: "Utils",
            targets: ["Utils"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "Coordinator",
            dependencies: [],
            path: "Sources/Coordinator"
        ),
        
            .target(
                name: "Alert",
                dependencies: [],
                path: "Sources/Alert"
            ),
        
            .target(
                name: "Utils",
                dependencies: [],
                path: "Sources/Utils"
            ),
        
            .testTarget(
                name: "AlertTests",
                dependencies: ["Alert"]
            ),
        
            .testTarget(
                name: "CoordinatorTests",
                dependencies: ["Coordinator"]
            ),
        
            .testTarget(
                name: "UtilsTests",
                dependencies: ["Utils"]
            ),
    ]
)
