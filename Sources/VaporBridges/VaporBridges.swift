import Vapor
import Bridges

extension Application: BridgesApplication {
    struct Key: StorageKey {
        typealias Value = Bridges
    }
    
    public var bridges: Bridges {
        if storage[Key.self] == nil {
            let b = Bridges(eventLoopGroup: eventLoopGroup, logger: logger)
            storage[Key.self] = b
            return b
        }
        return storage[Key.self]!
    }
}

//import Bridge
//import Vapor
//
//extension Request {
//    public var db: Bridge {
//        self.db(nil)
//    }
//
//    public func bridge(_ id: DatabaseIdentifier?) -> Database {
//        application.databases.database(id, logger: self.logger, on: self.eventLoop)!
//    }
//}
//
//extension Application {
//    public var db: Database {
//        self.db(nil)
//    }
//
//    public func db(_ id: DatabaseID?) -> Database {
//        self.databases
//            .database(id, logger: self.logger, on: self.eventLoopGroup.next())!
//    }
//
//    public var databases: Databases {
//        self.fluent.storage.databases
//    }
//
//    public var migrations: Migrations {
//        self.fluent.storage.migrations
//    }
//
//    public var migrator: Migrator {
//        Migrator(
//            databases: self.databases,
//            migrations: self.migrations,
//            logger: self.logger,
//            on: self.eventLoopGroup.next()
//        )
//    }
//
//    /// Automatically runs forward migrations without confirmation.
//    /// This can be triggered by passing `--auto-migrate` flag.
//    public func autoMigrate() -> EventLoopFuture<Void> {
//        self.migrator.setupIfNeeded().flatMap {
//            self.migrator.prepareBatch()
//        }
//    }
//
//    /// Automatically runs reverse migrations without confirmation.
//    /// This can be triggered by passing `--auto-revert` during boot.
//    public func autoRevert() -> EventLoopFuture<Void> {
//        self.migrator.setupIfNeeded().flatMap {
//            self.migrator.revertAllBatches()
//        }
//    }
//
//    public struct Fluent {
//        final class Storage {
//            let databases: Databases
//            let migrations: Migrations
//
//            init(threadPool: NIOThreadPool, on eventLoopGroup: EventLoopGroup) {
//                self.databases = Databases(
//                    threadPool: threadPool,
//                    on: eventLoopGroup
//                )
//                self.migrations = .init()
//            }
//        }
//
//        struct Key: StorageKey {
//            typealias Value = Storage
//        }
//
//        struct Lifecycle: LifecycleHandler {
//            func willBoot(_ application: Application) throws {}
//            func shutdown(_ application: Application) {
//                application.databases.shutdown()
//            }
//        }
//
//        let application: Application
//
//        var storage: Storage {
//            if self.application.storage[Key.self] == nil {
//                self.initialize()
//            }
//            return self.application.storage[Key.self]!
//        }
//
//        func initialize() {
//            self.application.storage[Key.self] = .init(
//                threadPool: self.application.threadPool,
//                on: self.application.eventLoopGroup
//            )
//            self.application.lifecycle.use(Lifecycle())
//            self.application.commands.use(MigrateCommand(), as: "migrate")
//        }
//    }
//
//    public var fluent: Fluent {
//        .init(application: self)
//    }
//}
