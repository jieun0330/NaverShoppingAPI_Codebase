//
//  NickcnameSettingViewController.swift
//  SeSAC_Recap
//
//  Created by 박지은 on 1/28/24.
//

import UIKit
import SnapKit

class NickcnameSettingViewController: BaseViewController {
    
    let viewModel = NicknameViewModel()
    
    let randomNum = Int.random(in: 1...14)
    
    lazy var profileImg = UIButton().then {
        $0.layer.borderWidth = 5
        $0.layer.borderColor = Colors.pointColor.cgColor
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 40
        $0.clipsToBounds = true
        $0.addTarget(self, action: #selector(profileImgClicked), for: .touchUpInside)
    }
    
    let cameraImg = UIImageView().then {
        $0.image = .camera
    }
    
    lazy var nicknameTextField = UITextField().then {
        $0.placeholder = "닉네임을 입력해주세요 :)"
        $0.font = Fonts.font13
        $0.addTarget(self, action: #selector(nicknameTextFieldEdited), for: .editingChanged)
    }
    
    let divider = UIView().then {
        $0.backgroundColor = .white
    }
    
    let nicknameCondition = UILabel().then {
        $0.text = ""
        $0.font = Fonts.font13
    }
    
    lazy var doneButton = UIButton().then {
        $0.setTitle("완료", for: .normal)
        $0.setTitleColor(Colors.textColor, for: .normal)
        $0.backgroundColor = Colors.pointColor
        $0.layer.cornerRadius = 5
        $0.addTarget(self, action: #selector(doneButtonClicked), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func configureHierarchy() {
        
        [profileImg, cameraImg, nicknameTextField, divider, nicknameCondition, doneButton].forEach {
            view.addSubview($0)
        }
    }
    
    override func configureConstraints() {
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
    
    override func configureView() {
        view.backgroundColor = .black
        navigationItem.title = "프로필 설정"
        profileImg.setImage(UIImage(named: "profile\(randomNum)"), for: .normal)
        doneButton.isEnabled = false
    }
    
    @objc func profileImgClicked() {
        let vc = ProfileImageSettingViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func nicknameTextFieldEdited() {
        guard let nickname = nicknameTextField.text else { return }
        viewModel.inputNickname.value = nickname
        
        viewModel.outputValidation.bind { value in
            self.nicknameCondition.text = value
        }
        
        viewModel.outputValidationColor.bind { value in
            self.nicknameCondition.textColor = value ? .green : .red
            self.doneButton.isEnabled = value ? true : false
        }
    }
    
    @objc func doneButtonClicked() {
        guard let nickname = nicknameTextField.text else { return }
        UserDefaultManager.shared.nickname = nickname
        UserDefaultManager.shared.userState = true
        
        let vc = KeywordHistoryViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
