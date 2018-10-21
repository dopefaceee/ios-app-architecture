//
//  CoordinatorFactory.swift
//  Sample Architecture
//
//  Created by Fathony Teguh Irawan on 21/10/18.
//  Copyright © 2018 Fathony Teguh Irawan. All rights reserved.
//

import Foundation

protocol CoordinatorFactory {
    func makeMainCoordinator(router: Router) -> Coordinator
}
