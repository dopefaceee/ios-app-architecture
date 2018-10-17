//
//  PostRepositoryImpl.swift
//  Sample Architecture
//
//  Created by Fathony Teguh Irawan on 16/10/18.
//  Copyright © 2018 Fathony Teguh Irawan. All rights reserved.
//

import Foundation
import RxSwift

class PostRepositoryImpl : PostRepository {
    
    private let postAPI: PostAPI
    
    init(postAPI: PostAPI) {
        self.postAPI = postAPI
    }
    
    func getAllPost() -> Observable<[Post]> {
        return postAPI.getAllPostFromServer()
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .map({ (response) -> [Post] in
                response.map({ (post) -> Post in
                    Post(userId: post.userId, id: post.id, title: post.title, body: post.body)
                })
            })
            .asObservable()
    }
    
}
