// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftTesseract",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "SwiftTesseract",
            targets: ["SwiftTesseract"]
        ),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "SwiftTesseract",
            dependencies: [
                "CTesseract", "CLeptonica",
            ]
        ),
        .systemLibrary(
            name: "CTesseract",
            pkgConfig: "tesseract",
            providers: [
                .brew(["tesseract"]),
            ]
        ),
        .systemLibrary(
            name: "CLeptonica",
            pkgConfig: "lept",
            providers: [
                .brew(["leptonica"]),
            ]
        ),
        .testTarget(
            name: "SwiftTesseractTests",
            dependencies: ["SwiftTesseract"]),
    ]
)
