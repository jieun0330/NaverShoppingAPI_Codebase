//
//  NickcnameSettingViewController.swift
//  SeSAC_Recap
//
//  Created by 박지은 on 1/28/24.
//

import UIKit
import SnapKit

final class NickcnameSettingViewController: BaseViewController {
    
    private let viewModel = NicknameViewModel()
    
    private let randomNum = Int.random(in: 1...14)
    
    private lazy var profileImg: UIButton = {
        let button = UIButton()
        button.layer.borderWidth = 5
        button.layer.borderColor = Colors.pointColor.cgColor
        button.contentMode = .scaleAspectFill
        button.layer.cornerRadius = 40
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(profileImgClicked), for: .touchUpInside)
        return button
    }()
    
    private let cameraImg: UIImageView = {
        let image = UIImageView()
        image.image = .camera
        return image
    }()
    
    private lazy var nicknameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "닉네임을 입력해주세요 :)"
        textField.font = Fonts.font13
        textField.addTarget(self, action: #selector(nicknameTextFieldEdited), for: .editingChanged)
        return textField
    }()
    
    private let divider: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private let nicknameCondition: UILabel = {
        let condition = UILabel()
        condition.text = ""
        condition.font = Fonts.font13
        return condition
    }()
    
    private lazy var doneButton: UIButton = {
        let button = UIButton()
        button.setTitle("완료", for: .normal)
        button.setTitleColor(Colors.textColor, for: .normal)
        button.backgroundColor = Colors.pointColor
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(doneButtonClicked), for: .touchUpInside)
        return button
    }()
    
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
    
    @objc private func profileImgClicked() {
        let vc = ProfileImageSettingViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func nicknameTextFieldEdited() {
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
    
    @objc private func doneButtonClicked() {
        guard let nickname = nicknameTextField.text else { return }
        UserDefaultManager.shared.nickname = nickname
        UserDefaultManager.shared.userState = true
        
        let vc = KeywordHistoryViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
