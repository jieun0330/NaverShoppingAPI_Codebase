//
//  NicknameViewController.swift
//  SeSAC_Recap
//
//  Created by 박지은 on 1/18/24.
//

import UIKit

class NicknameViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var profileImg: UIImageView!
    @IBOutlet var cameraImg: UIImageView!
    @IBOutlet var nicknameTextField: UITextField!
    @IBOutlet var nicknameCondition: UILabel!
    @IBOutlet var doneButton: UIButton!
    
    let nickname = UserDefaults.standard.string(forKey: "Nickname")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
        nicknameTextField.delegate = self
        nicknameTextField.smartDashesType = .no
        
        doneButton.addTarget(self, action: #selector(doneButtonClicked), for: .touchUpInside)
    }
    
    @objc func doneButtonClicked() {
        let vc = storyboard?.instantiateViewController(identifier: MainViewController.identifier) as! MainViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        if string == "#@$%" {
//            return false
//        }
//        return true
//    }
    
    @IBAction func nickNameTextFieldTapped(_ sender: UITextField) {
        
        if let nickname = Int(sender.text!) {
            nicknameCondition.text = "닉네임에 숫자는 포함할 수 없어요"
        } else if sender.text!.count < 2 || sender.text!.count > 10 {
            nicknameCondition.text = "2글자 이상 10글자 미만으로 설정해주세요"
        } else {
            nicknameCondition.text = "사용할 수 있는 닉네임이에요"
        }
        
        UserDefaults.standard.set(nicknameTextField.text, forKey: "Nickname")
        
    }
    
    @IBAction func imageClicked(_ sender: UITapGestureRecognizer) {
        let vc = storyboard?.instantiateViewController(identifier: SettingProfileViewController.identifier) as! SettingProfileViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func keyboardDismiss(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
        UserDefaults.standard.set(nicknameTextField.text, forKey: "Nickname")
        
    }
    
}

extension NicknameViewController {
    func configureUI() {
        navigationItem.title = "프로필 설정"
        
        let randomNum = Int.random(in: 1...14)
        profileImg.image = UIImage(named: "profile\(randomNum)")
        profileImg.contentMode = .scaleAspectFill
        profileImg.layer.masksToBounds = false
        profileImg.layer.cornerRadius = profileImg.frame.height / 2
        profileImg.clipsToBounds = true
        profileImg.layer.borderWidth = 5
        profileImg.layer.borderColor = Colors.pointColor.cgColor
        
        cameraImg.image = .camera
        
        nicknameTextField.placeholder = "닉네임을 입력해주세요 :)"
        nicknameTextField.font = Fonts.font13
        
        nicknameCondition.textColor = Colors.pointColor
        nicknameCondition.font = Fonts.font13
        
        doneButton.configurePrimaryStyle(title: "완료")
        
    }
    
}
