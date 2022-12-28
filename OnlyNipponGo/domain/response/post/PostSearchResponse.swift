//
//  PostSearchResponse.swift
//  OnlyNipponGo
//
//  Created by 木村猛 on 2022/12/26.
//

import Foundation

struct PostSearchResponse: Decodable {
    var id: Int = 0
    var userId: Int = 0
    var createDate: String = ""
    var familyName: String = ""
    var givenName: String = ""
    var nickName: String? = ""
    var userImage: String? = ""
    var userProfileImage: String? = ""
}
