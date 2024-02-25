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
        $0.backgroundColor = .systemGray6
        $0.layer.cornerRadius = 15
    }
    
    let profileImg = UIImageView().then {
        $0.image = .profile1
        $0.layer.borderColor = Colors.pointColor.cgColor
        $0.layer.borderWidth = 5
        $0.layer.cornerRadius = 30
        $0.clipsToBounds = true
    }
    
    let nickname = UILabel().then {
        $0.text = "떠나고싶은 고래밥"
        $0.font = UIFont.boldSystemFont(ofSize: 16)
    }
    
    let likeProduct = UILabel().then {
        $0.text = "8개의 상품을 좋아하고 있어요!"
        $0.font = UIFont.boldSystemFont(ofSize: 14)
    }
    
    lazy var tableView = UITableView().then {
        $0.backgroundColor = .systemGray6
        $0.layer.cornerRadius = 15
        $0.delegate = self
        $0.dataSource = self
        $0.register(UITableViewCell.self, forCellReuseIdentifier: "SettingCell")
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
            $0.height.equalTo(80)
        }
        
        profileImg.snp.makeConstraints {
            $0.centerY.equalTo(profileBox)
            $0.leading.equalToSuperview().offset(20)
            $0.size.equalTo(60)
        }
        
        nickname.snp.makeConstraints {
            $0.leading.equalTo(profileImg.snp.trailing).offset(20)
            $0.top.equalToSuperview().offset(20)
        }
        
        likeProduct.snp.makeConstraints {
            $0.leading.equalTo(nickname.snp.leading)
            $0.top.equalTo(nickname.snp.bottom).offset(5)
        }
        
        tableView.snp.makeConstraints {
            $0.horizontalEdges.equalTo(profileBox)
            $0.top.equalTo(profileBox.snp.bottom).offset(20)
            $0.height.equalTo(220)
        }
    }
    
    override func configureView() {
        view.backgroundColor = .black
        navigationItem.title = "설정"
    }
}

extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SettingEnum.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingCell")!
        cell.backgroundColor = .systemGray6
        cell.textLabel?.text = SettingEnum.allCases[indexPath.row].setting
        cell.textLabel?.font = UIFont.systemFont(ofSize: 14)
        
        return cell
    }
}
