//
//  HTTPClient.swift
//  Sample Architecture
//
//  Created by Fathony Teguh Irawan on 16/10/18.
//  Copyright © 2018 Fathony Teguh Irawan. All rights reserved.
//

import Foundation

protocol HTTPClient {
    var baseUrl: URL { get }
}

extension HTTPClient {
    func send<T: Codable>(request apiRequest: HTTPRequest, onResponse callback: @escaping (AsyncResult<T>) -> Void) -> URLSessionDataTask {
        let request = apiRequest.request(with: self.baseUrl)
        let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            do {
                let model: T = try JSONDecoder().decode(T.self, from: data ?? Data())
                callback(.success(model))
            } catch let error {
                callback(.error(error))
            }
        })
        task.resume()
        
        return task
    }
}
