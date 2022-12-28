//
//  AccountCreateParameter.swift
//  OnlyNipponGo
//
//  Created by 木村猛 on 2022/12/19.
//

import Foundation

struct AccountCreateRequest: Encodable {
    var familyName: String
    var givenName: String
    var nickName: String
}
