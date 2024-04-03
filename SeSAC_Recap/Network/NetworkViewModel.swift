//
//  NetworkViewModel.swift
//  SeSAC_Recap
//
//  Created by 박지은 on 2/26/24.
//

import Foundation
import Alamofire

class NetworkViewModel {
    var inputSearchText = Observable("")
    
    var display = 30
    var start = 1
    var sort = SortType.sim
    
    func transform() {
        
        inputSearchText.bind { value in
            if value.count != 0 {
                self.callRequest(text: value)
            }
        }
    }
    
    init() {
        transform()
    }
    
    // 정확도, 가격낮은순, 높은순, 최신순 버튼을 눌렀을때 SortType의 rawValue를 불러올거기 때문에 sort: String으로 매개변수를 받는다?
    func callRequest(text: String) {
        // 검색을 하면 그냥 한글 String으로 들어올테니 PercentEncoding하기 위한 작업
        let query = text.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let url = "https://openapi.naver.com/v1/search/shop?query=\(query)&display=\(display)&sort=\(sort)&start=\(start)"
        let header: HTTPHeaders = ["X-Naver-Client-Id": APIKey.clientID,
                                   "X-Naver-Client-Secret": APIKey.clientSecret]
        
        AF
            .request(url, method: .get, headers: header)
            .responseDecodable(of: Shopping.self) { response in
                switch response.result {
                case .success(let success):
                    print(success)
                case .failure(let failure):
                    dump(failure)
                }
        }
    }
}
