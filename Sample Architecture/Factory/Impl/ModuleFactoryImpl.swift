//
//  ModuleFactoryImpl.swift
//  Sample Architecture
//
//  Created by Fathony Teguh Irawan on 21/10/18.
//  Copyright © 2018 Fathony Teguh Irawan. All rights reserved.
//

import Foundation

class ModuleFactoryImpl:
    AppModuleFactory,
MainModuleFactory {
    
    func makeHTTPClient() -> HTTPClient {
        return JsonPlaceholderClient()
    }
    
    func makePostAPI() -> PostAPI {
        return PostAPI(httpClient: makeHTTPClient())
    }
    
    func makePostRepository() -> PostRepository {
        return PostRepositoryImpl(postAPI: makePostAPI())
    }
    
    func makeMainViewModel() -> HomeViewModel {
        return HomeViewModel(makePostRepository())
    }
    
    func makeHomeView() -> HomeView {
        let vc = HomeViewController()
        vc.viewModel = makeMainViewModel()
        return vc
    }
    
    func makeDetailView(post: Post) -> DetailView {
        let vc = DetailViewController()
        vc.post = post
        return vc
    }
    
    
}
