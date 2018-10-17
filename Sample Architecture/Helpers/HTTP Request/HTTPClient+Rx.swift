//
//  HTTPClient+Rx.swift
//  Sample Architecture
//
//  Created by Fathony Teguh Irawan on 17/10/18.
//  Copyright © 2018 Fathony Teguh Irawan. All rights reserved.
//

import Foundation
import RxSwift

extension HTTPClient {
    func send<T: Codable>(request apiRequest: HTTPRequest) -> Single<T> {
        return Single<T>.create { single in
            let request = apiRequest.request(with: self.baseUrl)
            let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
                do {
                    let model: T = try JSONDecoder().decode(T.self, from: data ?? Data())
                    single(.success(model))
                } catch let error {
                    single(.error(error))
                }
            })
            task.resume()
            
            return Disposables.create {
                task.cancel()
            }
        }
    }
}
