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
        
        .testTarget(
            name: "AlertTests",
            dependencies: ["Alert"]
        ),
        
        .testTarget(
            name: "CoordinatorTests",
            dependencies: ["Coordinator"]
        ),
    ]
)
