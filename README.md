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
