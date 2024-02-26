//
//  ProfileImageSettingViewController.swift
//  SeSAC_Recap
//
//  Created by 박지은 on 1/28/24.
//

import UIKit
import SnapKit

class ProfileImageSettingViewController: BaseViewController {
    
    let selectedProfileImg = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.layer.masksToBounds = false
        $0.layer.cornerRadius = 50
        $0.clipsToBounds = true
        $0.layer.borderWidth = 5
        $0.layer.borderColor = Colors.pointColor.cgColor
        $0.image = UIImage(named: "profile\(UserDefaultManager.shared.profileImg)")
    }
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: configureCollectionViewLayout()).then {
        $0.register(ProfileImageSettingCollectionViewCell.self, forCellWithReuseIdentifier: ProfileImageSettingCollectionViewCell.identifier)
        $0.layer.borderColor = UIColor.red.cgColor
        $0.layer.borderWidth = 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configureHierarchy() {
        [selectedProfileImg, collectionView].forEach {
            view.addSubview($0)
        }
    }
    
    override func configureConstraints() {
        selectedProfileImg.snp.makeConstraints {
            $0.centerX.equalTo(view)
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.size.equalTo(100)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(selectedProfileImg.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(400)
        }
    }
    
    override func configureView() {
        view.backgroundColor = .black
        navigationItem.title = "프로필 설정"
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    static func configureCollectionViewLayout() -> UICollectionViewLayout {
        // 콜렉션뷰 레이아웃을 설정할 수 있도록 도와주는 클래스 FlowLayout
        let layout = UICollectionViewFlowLayout()
        
        // Int로 되지 않게끔 CGFloat으로 미리 써준다
        // CGFloat이 뭐냐
        // Float은 32비트,, 부동,, 소수형,,
        // Double은 64비트,, 부동,, 소수형,,
        // CGFloat은 자동적으로 플랫폼에 따라 32비트는 float이 되고
        // 64비트에서는 dobule이 된다
        // float일수도있고 double일수도있고
        // 오홀ㅇ~ float을 쓸지 double을 쓸지 신경 안쓰고 알아서 처리하게 만들려면 cgfloat을 사용하면 된다
        // ㅇㅋ
        let spacing: CGFloat = 10
        // 전체 스크린 가로 길이 - 전체 여백
        let cellWidth = UIScreen.main.bounds.width - (spacing * 6)
        // 여백을 쏙 뺀 아이템들의 가로와 세로 길이
        layout.itemSize = CGSize(width: cellWidth / 4, height: cellWidth / 4)


        // 셀을 어디서 시작할지, 상하좌우 여백을 얼마나 남길지
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        // 열에서 아이템간의 최소 간격
        layout.minimumLineSpacing = 0
        // 행에서 아이템간의 최소 간격
        layout.minimumInteritemSpacing = spacing
                
        return layout
    }
}

extension ProfileImageSettingViewController: UICollectionViewDataSource, UICollectionViewDelegate  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 14
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileImageSettingCollectionViewCell.identifier, for: indexPath) as! ProfileImageSettingCollectionViewCell
        
        cell.profileCollectionImg.image = .profile1
        
        return cell
    }
}
