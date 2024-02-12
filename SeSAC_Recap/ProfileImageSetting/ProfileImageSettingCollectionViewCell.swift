//
//  ProfileImageSettingCollectionViewCell.swift
//  SeSAC_Recap
//
//  Created by 박지은 on 1/28/24.
//

import UIKit

class ProfileImageSettingCollectionViewCell: UICollectionViewCell {
    
    let profileCollectionImg = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureCollectionImg()
    }
    
    func configureCollectionImg() {
        contentMode = .scaleAspectFill
        layer.masksToBounds = false
        layer.cornerRadius = 10
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")        
    }
}
