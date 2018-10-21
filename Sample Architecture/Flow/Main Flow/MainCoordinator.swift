//
//  MainCoordinator.swift
//  Sample Architecture
//
//  Created by Fathony Teguh Irawan on 18/10/18.
//  Copyright © 2018 Fathony Teguh Irawan. All rights reserved.
//

import Foundation

class MainCoordinator: BaseCoordinator {
    
    private let router: Router
    private let factory: MainModuleFactory
    
    init(router: Router, factory: MainModuleFactory) {
        self.router = router
        self.factory = factory
    }
    
    override func start() {
        showTableView()
    }
    
    private func showTableView() {
        let homeView = factory.makeHomeView()
        homeView.onPostSelect = { [weak self](value) in
            self?.showDetailView(value)
        }
        router.setRootModule(homeView.toPresent())
    }
    
    private func showDetailView(_ param: Post) {
        let detailView = factory.makeDetailView(post: param)
        router.push(detailView.toPresent(), animated: true)
    }
}
