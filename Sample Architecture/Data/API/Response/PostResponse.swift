//
//  PostResponse.swift
//  Sample Architecture
//
//  Created by Fathony Teguh Irawan on 17/10/18.
//  Copyright © 2018 Fathony Teguh Irawan. All rights reserved.
//

import Foundation

struct PostResponse: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
    
    private enum CodingKeys: String, CodingKey {
        case userId
        case id
        case title
        case body
    }
}
