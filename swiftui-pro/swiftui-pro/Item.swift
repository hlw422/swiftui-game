//
//  Item.swift
//  swiftui-pro
//
//  Created by lw h on 2025/2/27.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
