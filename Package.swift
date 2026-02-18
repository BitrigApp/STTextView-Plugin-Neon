// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "STTextView-Plugin-Neon",
    platforms: [.macOS(.v14), .iOS(.v16), .macCatalyst(.v16)],
    products: [
        .library(
            name: "STTextView-Plugin-Neon",
            targets: ["STPluginNeon"]),
    ],
    dependencies: [
        .package(url: "https://github.com/krzyzanowskim/STTextView", from: "2.3.4"),
        .package(url: "https://github.com/kylemacomber/Neon", branch: "main"),
        .package(url: "https://github.com/ChimeHQ/SwiftTreeSitter", from: "0.9.0")
    ],
    targets: [
        .target(
            name: "STPluginNeon",
            dependencies: [
                .target(name: "STPluginNeonAppKit", condition: .when(platforms: [.macOS])),
                .target(name: "STPluginNeonUIKit", condition: .when(platforms: [.iOS, .macCatalyst]))
            ],
            resources: [.process("Themes.xcassets")]
        ),
        .target(
            name: "STPluginNeonAppKit",
            dependencies: [
                .product(name: "STTextView", package: "STTextView"),
                .product(name: "Neon", package: "Neon"),
                .target(name: "TreeSitterResource")
            ],
        ),
        .target(
            name: "STPluginNeonUIKit",
            dependencies: [
                .product(name: "STTextView", package: "STTextView"),
                .product(name: "Neon", package: "Neon"),
                .target(name: "TreeSitterResource")
            ],
        ),
        .target(
            name: "TreeSitterResource",
            dependencies: [
                .product(name: "SwiftTreeSitter", package: "SwiftTreeSitter"),
                .target(name: "TreeSitterSwift"),
                .target(name: "TreeSitterSwiftQueries"),
            ]
        ),
        .target(name: "TreeSitterSwift", cSettings: [.headerSearchPath("src")]),
        .target(name: "TreeSitterSwiftQueries", resources: [.copy("highlights.scm"), .copy("locals.scm")]),
    ]
)
