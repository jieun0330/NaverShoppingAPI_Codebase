//
//  Model.swift
//  SeSAC_Recap
//
//  Created by 박지은 on 2/26/24.
//

import Foundation

struct Shopping: Decodable {
    let total: Int
    let items: [Item]
}

// MARK: - Item
struct Item: Decodable {
    let title: String
    let link: String
    let image: String
    let lprice, hprice, mallName, productID: String

    enum CodingKeys: String, CodingKey {
        case title, link, image, lprice, hprice, mallName
        case productID = "productId"
    }
}
