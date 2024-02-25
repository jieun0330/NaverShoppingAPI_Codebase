//
//  SettingEnum.swift
//  SeSAC_Recap
//
//  Created by 박지은 on 2/25/24.
//

import Foundation

enum SettingEnum: CaseIterable {
    case notice
    case question
    case personal
    case notification
    case restart
    
    var setting: String {
        switch self {
        case .notice:
            return "공지사항"
        case .question:
            return "자주 묻는 질문"
        case .personal:
            return "1:1 문의"
        case .notification:
            return "알림 설정"
        case .restart:
            return "처음부터 시작하기"
        }
    }
}
