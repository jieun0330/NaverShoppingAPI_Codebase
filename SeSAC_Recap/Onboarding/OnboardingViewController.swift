//
//  OnboardingCodeViewController.swift
//  SeSAC_Recap
//
//  Created by 박지은 on 1/28/24.
//

import UIKit
import SnapKit

final class OnboardingViewController: BaseViewController {
    
    private let onboardingTitle: UIImageView = {
        let image = UIImageView()
        image.image = .sesacShopping
        return image
    }()
    
    private let onboardingImg: UIImageView = {
        let image = UIImageView()
        image.image = .onboarding
        return image
    }()
    
    private lazy var startButton: UIButton = {
        let button = UIButton()
        button.setTitle("시작하기", for: .normal)
        button.setTitleColor(Colors.textColor, for: .normal)
        button.backgroundColor = Colors.pointColor
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(startButtonClicked), for: .touchUpInside)
        return button
    }()
    
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
    
    @objc private func startButtonClicked() {
        let vc = NickcnameSettingViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
