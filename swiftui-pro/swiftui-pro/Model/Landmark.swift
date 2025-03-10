//
//  Landmark.swift
//  swiftui-pro
//
//  Created by lw h on 2025/3/6.
//

import Foundation

                    
struct Landmark: Identifiable,Codable {
    let id: String
    let name: String
    let city: String
    let description: String
    let imageName: String
    let coordinates: Coordinates
    
    
    /**
     在 Swift 的 Codable 协议中，CodingKeys 枚举用来定义数据模型属性与 JSON 键之间的映射关系。
     默认情况下，Swift 会直接使用属性名作为 JSON 的键，但当 JSON 的键名与结构体的属性名不一致时
     （例如 JSON 中的 "image_name" 对应 Swift 中的 "imageName"），你就可以通过 CodingKeys 来指定映射规则。
     这样可以确保在编码（序列化）和解码（反序列化）过程中正确地匹配 JSON 数据和模型属性。
     */
    enum CodingKeys: String, CodingKey {
        case id, name, city, description, coordinates
        case imageName = "image_name"
    }
}

struct Coordinates: Codable {
    let longitude: Double
    let latitude: Double
}

