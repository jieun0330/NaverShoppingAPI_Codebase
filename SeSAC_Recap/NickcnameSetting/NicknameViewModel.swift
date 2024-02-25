//
//  NicknameViewModel.swift
//  SeSAC_Recap
//
//  Created by 박지은 on 2/23/24.
//

import Foundation

class NicknameViewModel {
    
    func nicknameTextFieldEdited(_ inputNickname: String) -> String {
        
        if inputNickname.count >= 2 && inputNickname.count < 10 {
            return "사용할 수 있는 닉네임입니다"
        } else {
            return "잘못 입력했습니다"
        }
    }
}
