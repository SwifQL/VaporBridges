// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "Example",
    platforms: [
        .macOS(.v10_14)
    ],
    products: [
        .executable(name: "Run", targets: ["Run"]),
        .library(name: "App", targets: ["App"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(path: "../"),
        .package(path: "../../PostgresBridge"),
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(name: "App", dependencies: ["VaporBridge", "PostgresBridge"]),
        .target(name: "Run", dependencies: ["App"]),
    ]
)
