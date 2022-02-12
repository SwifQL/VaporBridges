//
//  ModelAuthenticatable.swift
//  
//
//  Created by Mihael Isaev on 12.02.2022.
//

import Vapor
import Bridges

public protocol ModelAuthenticatable: Table, Authenticatable {
    static var usernameKey: KeyPath<Self, Column<String>> { get }
    static var passwordHashKey: KeyPath<Self, Column<String>> { get }
    func verify(password: String) throws -> Bool
}

extension ModelAuthenticatable {
    public static func authenticator(
        database: DatabaseIdentifier
    ) -> Authenticator {
        ModelAuthenticator<Self>(database: database)
    }

    var _$username: Column<String> {
        self[keyPath: Self.usernameKey]
    }

    var _$passwordHash: Column<String> {
        self[keyPath: Self.passwordHashKey]
    }
}

private struct ModelAuthenticator<User>: BasicAuthenticator
    where User: ModelAuthenticatable
{
    public let database: DatabaseIdentifier

    public func authenticate(
        basic: BasicAuthorization,
        for request: Request
    ) -> EventLoopFuture<Void> {
        User.query(on: database, on: request)
            .where(\User._$username == basic.username)
            .first()
            .flatMapThrowing
        {
            guard let user = $0 else {
                return
            }
            guard try user.verify(password: basic.password) else {
                return
            }
            request.auth.login(user)
        }
    }
}
