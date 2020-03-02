<p align="center">
    <a href="LICENSE">
        <img src="https://img.shields.io/badge/license-MIT-brightgreen.svg" alt="MIT License">
    </a>
    <a href="https://swift.org">
        <img src="https://img.shields.io/badge/swift-5.2-brightgreen.svg" alt="Swift 5.2">
    </a>
    <img src="https://img.shields.io/github/workflow/status/SwifQL/VaporBridges/test" alt="Github Actions">
</p>

# Bridges + Vapor

Work with Postgres and MySQL with SwifQL through their pure NIO drivers.

## Installation

### PostgreSQL
```swift
.package(url: "https://github.com/SwifQL/PostgresBridge.git", from:"1.0.0-rc"),
.package(url: "https://github.com/SwifQL/VaporBridges.git", from:"1.0.0-rc"),
.target(name: "App", dependencies: [
    .product(name: "Vapor", package: "vapor"),
    .product(name: "PostgresBridge", package: "PostgresBridge"),
    .product(name: "VaporBridges", package: "VaporBridges")
]),
```

### MySQL
```swift
.package(url: "https://github.com/SwifQL/MySQLBridge.git", from:"1.0.0-rc"),
.package(url: "https://github.com/SwifQL/VaporBridges.git", from:"1.0.0-rc"),
.target(name: "App", dependencies: [
    .product(name: "Vapor", package: "vapor"),
    .product(name: "MySQLBridge", package: "MySQLBridge"),
    .product(name: "VaporBridges", package: "VaporBridges")
]),
```

For more info please take a look at the `Bridges` repo.
