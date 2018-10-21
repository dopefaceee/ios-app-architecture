//
//  AppModuleFactory.swift
//  Sample Architecture
//
//  Created by Fathony Teguh Irawan on 21/10/18.
//  Copyright © 2018 Fathony Teguh Irawan. All rights reserved.
//

import Foundation

protocol AppModuleFactory {
    func makeHTTPClient() -> HTTPClient
    func makePostAPI() -> PostAPI
    
    func makePostRepository() -> PostRepository
    
    // ViewModels
    func makeMainViewModel() -> HomeViewModel
}
