//
//  String+.swift
//  OnlyNipponGo
//
//  Created by 木村猛 on 2022/12/27.
//

import Foundation

extension String {
    func moreGreater(size: Int) -> Bool{
        
        if self.count > size {
            return true
        }
        
        return false
    }
}
