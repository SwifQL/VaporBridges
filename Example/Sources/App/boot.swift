import Vapor
import PostgresBridge
import VaporBridge
import SwifQL

struct ABC: Decodable, Tableable {
    static var entity: String { "AbC" }
}

func boot(_ application: Application) throws {
//    let ct = SwifQL.create.table("sandwich").newColumns(
//        NewColumn("id", .bigserial).primaryKey(),
//        NewColumn("age", .int).check(Path.Column("age") > 13).check(Path.Column("age") < 99),
//        NewColumn("name", .varchar(500)).notNull()
//    ).prepare(.psql).plain
    
//    let ct = SwifQL.update(Path.Table("sandwich")).set(Path.Column("age") == 15).where(Path.Column("age") < 13)
    
    let ct = SwifQL
    
//    let ct = SwifQL.insert.into[table: ABC.table][fields: "a", "b", "c"].values[values: 1, 2, 3].prepare(.psql).splitted.query
//    let ct = SwifQL.create.type("hello").as(.enum).values("one", "two", "three").semicolon.prepare(.psql).plain
//    let ct = SwifQL.select("heyy" => Type.bigint[]).create.function.semicolon.prepare(.psql).plain
    print("ct: \(ct)")
    
//    _ = SwifQL.insertInto(Attachment.table, fields: [\Attachment.$id, \Attachment.$objectId, \Attachment.$type, \Attachment.$path, \Attachment.$createdAt, \Attachment.$updatedAt]).values(UUID(), UUID(), AttachmentType.image, "aaa", Date(), Date()).execute(on: try application.db(.psql).psql()).always {
//        switch $0 {
//        case .failure(let error): print("aaa err: \(error)")
//        case .success: print("aaa success")
//        }
//    }
//
//    Attachment(objectId: UUID(), type: .image, path: "aaa").create()
}

//protocol AAA {
//    var wrappedValue: Codable { get }
//}
//
//extension Model {
//    func create() { // swifql db: PostgresDatabase
//        let properties = self.properties
//        let q = SwifQL
//            .insertInto(Self.table, fields: properties.map { $0.keyPath })
//            .values(properties.map { $0.value })
//            .prepare(.psql).plain
//        print("q: \(q)")
//    }
//}
