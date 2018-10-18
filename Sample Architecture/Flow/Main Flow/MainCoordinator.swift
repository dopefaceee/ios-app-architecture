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
    
    init(router: Router) {
        self.router = router
    }
    
    override func start() {
        showTableView()
    }
    
    private func showTableView() {
        let viewController = TableViewController()
        viewController.onItemClick = { [weak self](value) in
            self?.showDetailView(value)
        }
        router.setRootModule(viewController.toPresent())
    }
    
    private func showDetailView(_ param: String) {
        let viewController = DetailViewController()
        viewController.param = param
        router.push(viewController.toPresent(), animated: true)
    }
}
