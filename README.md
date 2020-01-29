<p align="center">
    <a href="LICENSE">
        <img src="https://img.shields.io/badge/license-MIT-brightgreen.svg" alt="MIT License">
    </a>
    <a href="https://swift.org">
        <img src="https://img.shields.io/badge/swift-5.1-brightgreen.svg" alt="Swift 5.1">
    </a>
    <img src="https://img.shields.io/github/workflow/status/SwifQL/VaporBridges/test" alt="Github Actions">
</p>

# Bridges + Vapor

Work with Postgres and MySQL with SwifQL through their pure NIO drivers.

## Installation

### PostgreSQL
```swift
.package(url: "https://github.com/SwifQL/PostgresBridge.git", from:"1.0.0-beta.1"),
.package(url: "https://github.com/SwifQL/VaporBridges.git", from:"1.0.0-beta.1"),
.target(name: "App", dependencies: ["Vapor", "PostgresBridge", "VaporBridges"]),
```

### MySQL
```swift
.package(url: "https://github.com/SwifQL/MySQLBridge.git", from:"1.0.0-beta.1"),
.package(url: "https://github.com/SwifQL/VaporBridges.git", from:"1.0.0-beta.1"),
.target(name: "App", dependencies: ["Vapor", "MySQLBridge", "VaporBridges"]),
```

For more info please take a look at the `Bridges` repo.
