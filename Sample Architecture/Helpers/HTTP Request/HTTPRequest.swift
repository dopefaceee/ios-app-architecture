//
//  HTTPRequest.swift
//  Sample Architecture
//
//  Created by Fathony Teguh Irawan on 16/10/18.
//  Copyright © 2018 Fathony Teguh Irawan. All rights reserved.
//

import Foundation

protocol HTTPRequest {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: [String: String] { get }
}

extension HTTPRequest {
    func request(with baseUrl: URL) -> URLRequest {
        guard var components = URLComponents(url: baseUrl.appendingPathComponent(self.path), resolvingAgainstBaseURL: false) else {
            fatalError("Unable to create URL components")
        }
        
        components.queryItems = self.parameters.map({ (args) -> URLQueryItem in
            URLQueryItem(name: args.key, value: args.value)
        })
        
        guard let url = components.url else {
            fatalError("Could not get URL")
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = self.method.rawValue
        return request
    }
}
