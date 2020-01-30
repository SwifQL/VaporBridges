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

extension Request: BridgesRequest {
    public var bridgesApplication: BridgesApplication { application }
}
