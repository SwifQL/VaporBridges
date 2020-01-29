//
//  File.swift
//  
//
//  Created by Mihael Isaev on 24.01.2020.
//

import Foundation
import Bridge
import SwifQL

struct Attachment: BridgeModel {
    @TableColumn(name: "id", type: .uuid, constraints: .primaryKey)
    var id: UUID
}
