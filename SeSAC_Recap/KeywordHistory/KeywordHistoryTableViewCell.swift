//
//  KeywordHistoryTableViewCell.swift
//  SeSAC_Recap
//
//  Created by 박지은 on 1/26/24.
//

import UIKit

class KeywordHistoryTableViewCell: UITableViewCell {
    
    let searchIcon = UIButton()
    let productName = UILabel()
    let xmarkButton = UIButton()
    
    // 3.1 Cell에 클로저 프로퍼티를 추가한다
    // ???????/왓
    var xmarkButtonAction: (() -> Void)?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // configureHierachy
        contentView.addSubview(searchIcon)
        contentView.addSubview(productName)
        contentView.addSubview(xmarkButton)
        
        //configureView
        searchIcon.tintColor = .white
        searchIcon.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        productName.textColor = Colors.textColor
        xmarkButton.tintColor = .white
        // 3.2 버튼에 추가해줄 action을 생성해준다
        xmarkButton.addTarget(self, action: #selector(xmarkButtonClicked), for: .touchUpInside)
        xmarkButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        
        //configureConstraints
        searchIcon.snp.makeConstraints {
            $0.size.equalTo(20)
            $0.leading.equalToSuperview().offset(20)
            $0.centerY.equalToSuperview()
        }
        
        productName.snp.makeConstraints {
            $0.leading.equalTo(searchIcon.snp.trailing).offset(20)
            $0.centerY.equalToSuperview()
        }
        
        xmarkButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-20)
            $0.centerY.equalToSuperview()
        }
    }
    
    @objc func xmarkButtonClicked() {
        xmarkButtonAction?()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
