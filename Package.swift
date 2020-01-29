// swift-tools-version:5.1
import PackageDescription
import Foundation

// MARK: - Conveniences

let localDev = ProcessInfo.processInfo.environment["LIBS_DEVELOPMENT"] == "1"
let devDir = "../"

struct Dep {
    let package: PackageDescription.Package.Dependency
    let targets: [Target.Dependency]
}

extension Array where Element == Dep {
    mutating func appendLocal(_ path: String, targets: Target.Dependency...) {
        append(.init(package: .package(path: "\(devDir)\(path)"), targets: targets))
    }

    mutating func append(_ url: String, from: Version, targets: Target.Dependency...) {
        append(.init(package: .package(url: url, from: from), targets: targets))
    }

    mutating func append(_ url: String, _ requirement: PackageDescription.Package.Dependency.Requirement, targets: Target.Dependency...) {
        append(.init(package: .package(url: url, requirement), targets: targets))
    }
}

// MARK: - Dependencies

var deps: [Dep] = []

deps.append("https://github.com/vapor/vapor.git", from: "4.0.0-beta.2", targets: "Vapor")

if localDev {
    deps.appendLocal("Bridges", targets: "Bridges")
} else {
    deps.append("https://github.com/SwifQL/Bridges.git", from: "1.0.0-beta.1", targets: "Bridges")
}

// MARK: - Package

let package = Package(
    name: "VaporBridges",
    platforms: [
       .macOS(.v10_14)
    ],
    products: [
        .library(name: "VaporBridges", targets: ["VaporBridges"]),
    ],
    dependencies: deps.map { $0.package },
    targets: [
        .target(name: "VaporBridges", dependencies: deps.flatMap { $0.targets }),
        .testTarget(name: "VaporBridgesTests", dependencies: ["VaporBridges"]),
    ]
)
