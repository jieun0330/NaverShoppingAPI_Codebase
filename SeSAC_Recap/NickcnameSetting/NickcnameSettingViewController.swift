//
//  NickcnameSettingViewController.swift
//  SeSAC_Recap
//
//  Created by 박지은 on 1/28/24.
//

import UIKit
import SnapKit

class NickcnameSettingViewController: UIViewController {
    
    let profileImg = UIImageView()
    let cameraImg = UIImageView()
    let nicknameTextField = UITextField()
    let divider = UIView()
    let nicknameCondition = UILabel()
    let doneButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "프로필 설정"
        
        configureHierachy()
        configureView()
        configureConstraints()
    }
    
    func configureHierachy() {

        [profileImg, cameraImg, nicknameTextField, divider, nicknameCondition, doneButton].forEach {
            view.addSubview($0)
        }
    }
    
    func configureView() {
        profileImg.layer.borderWidth = 5
        profileImg.layer.borderColor = Colors.pointColor.cgColor
        profileImg.image = .profile1
        profileImg.contentMode = .scaleAspectFill
        profileImg.layer.cornerRadius = 40
        profileImg.clipsToBounds = true
        
        cameraImg.image = .camera
        
        nicknameTextField.placeholder = "닉네임을 입력해주세요 :)"
        nicknameTextField.font = Fonts.font13
        
        // 홀리몰리~ tintColor가 아니라 backgroundColor로 줘야 나옴
        divider.backgroundColor = .white
        
        nicknameCondition.text = "닉네임 조건"
        nicknameCondition.font = Fonts.font13
        nicknameCondition.textColor = Colors.pointColor
        
        doneButton.setTitle("완료", for: .normal)
        doneButton.setTitleColor(Colors.textColor, for: .normal)
        doneButton.backgroundColor = Colors.pointColor
        doneButton.layer.cornerRadius = 5
    }
    
    func configureConstraints() {
        profileImg.snp.makeConstraints {
            $0.centerX.equalTo(view)
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.size.equalTo(80)
        }
        
        cameraImg.snp.makeConstraints {
            $0.size.equalTo(35)
            $0.trailing.equalTo(profileImg).offset(5)
            $0.bottom.equalTo(profileImg).offset(5)
        }
        
        nicknameTextField.snp.makeConstraints {
            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.top.equalTo(profileImg.snp.bottom).offset(20)
        }
        
        divider.snp.makeConstraints {
            // 홀리몰리~2 height만 주고 width값 안주니까 안보이지 몽총아~
            $0.width.equalTo(nicknameTextField.snp.width)
            $0.height.equalTo(1)
            $0.top.equalTo(nicknameTextField.snp.bottom).offset(10)
            $0.horizontalEdges.equalTo(nicknameTextField)
        }
        
        nicknameCondition.snp.makeConstraints {
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.top.equalTo(divider.snp.bottom).offset(20)
        }
        
        doneButton.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(45)
            $0.top.equalTo(nicknameCondition.snp.bottom).offset(20)
        }
    }
}
