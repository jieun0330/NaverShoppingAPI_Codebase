//
//  SettingViewController.swift
//  SeSAC_Recap
//
//  Created by 박지은 on 2/23/24.
//

import UIKit
import SnapKit

class SettingViewController: BaseViewController {
    
    let profileBox = UIView().then {
        $0.backgroundColor = .lightGray
    }
    
    let profileImg = UIImageView().then {
        $0.image = .profile1
        $0.layer.borderColor = Colors.pointColor.cgColor
    }

    let nickname = UILabel().then {
        $0.text = "떠나고싶은 고래밥"
    }
    
    let likeProduct = UILabel().then {
        $0.text = "8개의 상품을 좋아하고 있어요!"
    }
    
    let tableView = UITableView().then { _ in
//        $0.layer.borderColor = Colors.pointColor.cgColor
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func configureHierarchy() {
        [profileBox, tableView].forEach {
            view.addSubview($0)
        }
        
        [profileImg, nickname, likeProduct].forEach {
            profileBox.addSubview($0)
        }
    }
    
    override func configureConstraints() {
        profileBox.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.height.equalTo(100)
        }
        
//        profileImg.snp.makeConstraints {
//            $0.
//        }
    }
    
    override func configureView() {
        view.backgroundColor = .black
        navigationItem.title = "설정"
    }

}
