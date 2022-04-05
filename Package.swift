// swift-tools-version:5.4

import PackageDescription

let package = Package(
    name: "mdk_ios_core_ui",
    platforms: [.iOS(.v13), .tvOS(.v9), .watchOS(.v2)],
    products: [
        .library(
            name: "Alert",
            targets: ["Alert"]),
        
        .library(
            name: "Coordinator",
            targets: ["Coordinator"]),
        
        .library(
            name: "Coordinator+SwiftUI",
            targets: ["Coordinator+SwiftUI"]),
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
            name: "Coordinator+SwiftUI",
            dependencies: [.target(name: "Coordinator")],
            path: "Sources/Coordinator+SwiftUI"
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
