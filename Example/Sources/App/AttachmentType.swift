import Foundation
import Bridge

enum AttachmentType: String, BridgeEnum {
    case image, video
    
    var `extension`: String {
        switch self {
        case .image: return "jpg"
        case .video: return "mp4"
        }
    }
    
//    struct Create: PostgresEnumCreateMigration {
//        typealias Enum = AttachmentType
//    }
}
