//
//  AppCoordinator.swift
//  Sample Architecture
//
//  Created by Fathony Teguh Irawan on 18/10/18.
//  Copyright © 2018 Fathony Teguh Irawan. All rights reserved.
//

import Foundation

final class AppCoordinator: BaseCoordinator {
    
    private let router: Router
    
    init(router: Router) {
        self.router = router
    }
    
    override func start() {
        runMainFlow()
    }
    
    private func runMainFlow() {
        let mainCoordinator = MainCoordinator(router: router)
        self.addDependency(mainCoordinator)
        
        mainCoordinator.start()
    }
}
