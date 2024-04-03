//
//  KeywordResultViewController.swift
//  SeSAC_Recap
//
//  Created by 박지은 on 2/26/24.
//

import UIKit

class KeywordResultViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
//    override func configureHierarchy() {
//        <#code#>
//    }
//    
//    override func configureConstraints() {
//        <#code#>
//    }
//    
    override func configureView() {
        navigationItem.title = UserDefaultManager.shared.keywords[0]
    }


}
