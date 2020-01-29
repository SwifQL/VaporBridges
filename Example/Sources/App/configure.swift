import Vapor
import PostgresBridge
import VaporBridge

extension BridgeDatabaseIdentifier {
    static var kittest: BridgeDatabaseIdentifier { .init(name: "kittest", host: .psql) }
}

// Called before your application initializes.
public func configure(_ app: Application) throws {
    // Logger
    app.logger.logLevel = .debug
    
//    app.postgres.register(.kittest, on: app.eventLoopGroup)
//
//    let _: EventLoopFuture<Void> = app.postgres.transaction(to: .kittest, on: app.eventLoopGroup.next(), logger: app.logger) { conn in
//        conn.query("SELECT 'hello' as title").map { rows in
//            print(rows)
//        }
//    }
    
    try boot(app)
}

struct BlackORM {
    
}
