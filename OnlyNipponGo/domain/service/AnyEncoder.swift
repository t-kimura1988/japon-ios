//
//  AnyEncoder.swift
//  OnlyNipponGo
//
//  Created by 木村猛 on 2022/12/19.
//

import Foundation

struct AnyEncodable: Encodable {
    private let encodable: Encodable
    
    public init(_ encodable: Encodable) {
        self.encodable = encodable
    }
    
    func encode(to encoder: Encoder) throws {
        try encodable.encode(to: encoder)
    }
}
