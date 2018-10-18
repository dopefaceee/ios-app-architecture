//
//  PostAPI.swift
//  Sample Architecture
//
//  Created by Fathony Teguh Irawan on 17/10/18.
//  Copyright © 2018 Fathony Teguh Irawan. All rights reserved.
//

import Foundation
import RxSwift

class PostAPI {
    
    private class GetAllPostRequest: HTTPRequest {
        var method = HTTPMethod.GET
        var path = "posts"
        var parameters = [String: String]()
    }
    
    let httpClient: HTTPClient
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    func getAllPostFromServer() -> Single<[PostResponse]> {
        return httpClient.send(request: GetAllPostRequest())
    }
    
}
