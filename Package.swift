// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "OPPhotoEditor",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "OPPhotoEditor",
            targets: [
                "OPPhotoEditor",
                "OPPhotoEditorUI",
            ]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/SilenceLove/HXPhotoPicker.git", branch: "master"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "OPPhotoEditor",
            dependencies: [
                "HXPhotoPicker",
            ]
        ),
        .target(
            name: "OPPhotoEditorUI",
            dependencies: [
                
            ],
            path: "Sources/OPPhotoEditorUI"
        ),
        .testTarget(
            name: "OPPhotoEditorTests",
            dependencies: ["OPPhotoEditor"]),
    ]
)
