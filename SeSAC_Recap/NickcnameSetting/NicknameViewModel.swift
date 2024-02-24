//
//  NicknameViewModel.swift
//  SeSAC_Recap
//
//  Created by 박지은 on 2/23/24.
//

import Foundation

class NicknameViewModel {
    
//    var inputNickname = ""
//    var outputNickname = ""
    
    func textFieldChanged(_ input: String) -> String {
        if input.count >= 2 && input.count < 10 {
            return "사용할 수 있는 닉네임이에요"
        } else {
            return "잘못된 입력입니다"
        }
    }
}
