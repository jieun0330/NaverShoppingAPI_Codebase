//
//  OnboardingCodeViewController.swift
//  SeSAC_Recap
//
//  Created by 박지은 on 1/28/24.
//

import UIKit
import SnapKit

class OnboardingViewController: BaseViewController {
    
    let onboardingTitle = UIImageView().then {
        $0.image = .sesacShopping
    }
    
    let onboardingImg = UIImageView().then {
        $0.image = .onboarding
    }
    
    lazy var startButton = UIButton().then {
        $0.setTitle("시작하기", for: .normal)
        $0.setTitleColor(Colors.textColor, for: .normal)
        $0.backgroundColor = Colors.pointColor
        $0.layer.cornerRadius = 10
        $0.addTarget(self, action: #selector(startButtonClicked), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func configureHierarchy() {
        [onboardingTitle, onboardingImg, startButton].forEach {
            view.addSubview($0)
        }
    }
    
    override func configureConstraints() {
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
    
    override func configureView() {

    }
    
    @objc func startButtonClicked() {
        let vc = NickcnameSettingViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
