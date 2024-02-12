//
//  OnboardingCodeViewController.swift
//  SeSAC_Recap
//
//  Created by 박지은 on 1/28/24.
//

import UIKit
import SnapKit

class OnboardingViewController: UITabBarController {
    
    let onboardingTitle = UIImageView()
    let onboardingImg = UIImageView()
    let startButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHierachy()
        configureView()
        configureConstraints()
    }
    
    func configureHierachy() {
        [onboardingTitle, onboardingImg, startButton].forEach {
            view.addSubview($0)
        }
    }
    
    func configureView() {
        onboardingTitle.image = .sesacShopping
        onboardingImg.image = .onboarding
        startButton.setTitle("시작하기", for: .normal)
        startButton.setTitleColor(Colors.textColor, for: .normal)
        startButton.backgroundColor = Colors.pointColor
        startButton.layer.cornerRadius = 10
        startButton.addTarget(self, action: #selector(startButtonClicked), for: .touchUpInside)
    }
    
    @objc func startButtonClicked() {
        let vc = NickcnameSettingViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func configureConstraints() {
        onboardingTitle.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(onboardingImg.snp.top).offset(-50)
        }
        
        onboardingImg.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        
        startButton.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(45)
        }
    }
}
