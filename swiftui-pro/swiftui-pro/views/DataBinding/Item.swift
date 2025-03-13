//
//  Item.swift
//  swiftui-pro
//
//  Created by lw h on 2025/3/13.
//

import Foundation
import SwiftData

@Model
final class Item{
    var name:String=""
    var phone:String=""
    
    init(name: String, phone: String) {
        self.name = name
        self.phone = phone
    }
}
