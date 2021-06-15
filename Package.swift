// swift-tools-version:5.4

import PackageDescription

let package = Package(
    name: "MDK_Core_UI",
    platforms: [.iOS(.v13), .tvOS(.v9), .watchOS(.v2)],
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
