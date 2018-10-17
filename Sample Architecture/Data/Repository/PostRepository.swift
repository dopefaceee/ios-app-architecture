//
//  PostRepository.swift
//  Sample Architecture
//
//  Created by Fathony Teguh Irawan on 16/10/18.
//  Copyright © 2018 Fathony Teguh Irawan. All rights reserved.
//

import Foundation
import RxSwift

protocol PostRepository {
    
    func getAllPost() -> Observable<[Post]>
}
