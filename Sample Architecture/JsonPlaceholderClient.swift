//
//  JsonPlaceholderClient.swift
//  Sample Architecture
//
//  Created by Fathony Teguh Irawan on 17/10/18.
//  Copyright © 2018 Fathony Teguh Irawan. All rights reserved.
//

import Foundation

class JsonPlaceholderClient : HTTPClient {
    var baseUrl = URL(string: "https://jsonplaceholder.typicode.com/")!
}
