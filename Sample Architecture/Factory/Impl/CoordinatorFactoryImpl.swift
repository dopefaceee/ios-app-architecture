//
//  CoordinatorFactoryImpl.swift
//  Sample Architecture
//
//  Created by Fathony Teguh Irawan on 21/10/18.
//  Copyright © 2018 Fathony Teguh Irawan. All rights reserved.
//

import Foundation

class CoordinatorFactoryImpl: CoordinatorFactory {
    
    func makeMainCoordinator(router: Router) -> Coordinator {
        return MainCoordinator(router: router, factory: ModuleFactoryImpl())
    }
    
}
