//
//  ProfileImageSettingViewController.swift
//  SeSAC_Recap
//
//  Created by 박지은 on 1/28/24.
//

import UIKit
import SnapKit

class ProfileImageSettingViewController: UIViewController {
    
    let selectedProfileImg = UIImageView()
    // frame: .zero -> constraints로 크기를 설정하기 때문에 zero 값을 넣는다
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: configureCollectionViewLayout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "프로필 설정"
        
        configureHierachy()
        configureView()
        configureConstraints()
    }
    
    func configureHierachy() {
        
        [selectedProfileImg, collectionView].forEach {
            view.addSubview($0)
        }
    }
    
    func configureView() {
        view.backgroundColor = .black
        
        selectedProfileImg.contentMode = .scaleAspectFill
        selectedProfileImg.layer.masksToBounds = false
        selectedProfileImg.layer.cornerRadius = 70
        selectedProfileImg.clipsToBounds = true
        selectedProfileImg.layer.borderWidth = 5
        selectedProfileImg.layer.borderColor = Colors.pointColor.cgColor
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // 앞에는 .self 뒤에는 .identifier
        // 이건 등록만 하는거니까 아래 cell 재사용할때처럼 타입캐스팅은 따로 안씀
        //        collectionView.register(ProfileImgCollectionViewCell.self, forCellWithReuseIdentifier: ProfileImgCollectionViewCell.identifier)
    }
    
    func configureConstraints() {
        selectedProfileImg.snp.makeConstraints {
            $0.centerX.equalTo(view)
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(20)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(selectedProfileImg.snp.bottom).offset(20)
        }
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
        // 행에서 아이템간의 최소 간격
        layout.minimumInteritemSpacing = spacing
        // 열에서 아이템간의 최소 간격
        layout.minimumLineSpacing = spacing
        let cellWidth = UIScreen.main.bounds.width - (spacing * 5)
        layout.itemSize = CGSize(width: cellWidth / 4, height: cellWidth / 4)
        // 셀을 어디서 시작할지, 상하좌우 여백을 얼마나 남길지
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        
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
