//
//  NicknameViewModel.swift
//  SeSAC_Recap
//
//  Created by 박지은 on 2/23/24.
//

import Foundation

class NicknameViewModel {
    
    var inputNickname = Observable("")
    var outputValidation = Observable("")
    var outputValidationColor = Observable(false)
    
    init() {
        inputNickname.bind { value in
            self.validation(nickname: value)
        }
    }
    
    func validation(nickname: String) {
        
        let num = CharacterSet(charactersIn: "0123456789")
        let char = CharacterSet(charactersIn: "#@$%")
        
        if nickname.count <= 2 || nickname.count > 10 {
            outputValidation.value = "2글자 이상 10글자 미만으로 설정해주세요"
            outputValidationColor.value = false
        } else if nickname.rangeOfCharacter(from: num) != nil {
            outputValidation.value = "닉네임에 숫자는 포함할 수 없어요"
            outputValidationColor.value = false
        } else if nickname.rangeOfCharacter(from: char) != nil {
            outputValidation.value = "닉네임에 @,#,$,%는 포함할 수 없어요."
            outputValidationColor.value = false
        } else {
            outputValidation.value = ""
            outputValidationColor.value = true
        }
    }
}
