//
//  AccountResponse.swift
//  OnlyNipponGo
//
//  Created by 木村猛 on 2022/12/19.
//

import Foundation

struct AccountResponse: Decodable {
    var userId: Int = 0
    var uid: String = ""
    var familyName: String = ""
    var givenName: String = ""
    var nickName: String? = ""
    var userImage: String? = ""
    var email: String = ""
    var userProfileImage: String? = ""
    var delFlg: String = ""
    
    func accountName() -> String {
        return "\(familyName)  \(givenName) "
    }
    
    func getUserImage() -> String {
        guard let userImage = userImage else {
            return ""
        }
        
        return userImage

    }
    
    func getUserProfileImage() -> String {
        guard let userProfileImage = userProfileImage else {
            return ""
        }
        
        return userProfileImage

    }
    
}
