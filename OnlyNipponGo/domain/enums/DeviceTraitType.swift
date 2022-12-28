//
//  DeviceTraitType.swift
//  OnlyNipponGo
//
//  Created by 木村猛 on 2022/12/24.
//
import SwiftUI
enum DeviceTraitStatus {
    case wRhR
    case wChR
    case wRhC
    case wChC

    init(hSizeClass: UserInterfaceSizeClass?, vSizeClass: UserInterfaceSizeClass?) {

        switch (hSizeClass, vSizeClass) {
        case (.regular, .regular):// IPad 横向き
            self = .wRhR
        case (.compact, .regular):// IPhone 縦向き
            self = .wChR
        case (.regular, .compact): // 大きいIPhoneの横向き
            self = .wRhC
        case (.compact, .compact): // IPhone　横向き
            self = .wChC
        default:
            self = .wChR
        }
    }
}
