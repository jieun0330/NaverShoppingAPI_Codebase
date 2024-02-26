//
//  ProfileImageSettingCollectionViewCell.swift
//  SeSAC_Recap
//
//  Created by 박지은 on 1/28/24.
//

import UIKit

class ProfileImageSettingCollectionViewCell: BaseCollectionViewCell {
    
    let profileCollectionImg = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.layer.masksToBounds = false
        $0.layer.cornerRadius = 20
        $0.clipsToBounds = true
        $0.image = .profile1
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    override func configureHierarchy() {
        [profileCollectionImg].forEach {
            contentView.addSubview($0)
        }
    }
    
    override func configureConstraints() {
        profileCollectionImg.snp.makeConstraints {
            $0.leading.top.equalTo(contentView)
            $0.size.equalTo(70)
        }
    }
    
//    override func configureView() {
//        <#code#>
//    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")        
    }
}
