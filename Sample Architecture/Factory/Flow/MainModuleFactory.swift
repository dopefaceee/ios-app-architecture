//
//  HomeFlowFactory.swift
//  Sample Architecture
//
//  Created by Fathony Teguh Irawan on 21/10/18.
//  Copyright © 2018 Fathony Teguh Irawan. All rights reserved.
//

import Foundation

protocol MainModuleFactory {
    func makeHomeView() -> HomeView
    func makeDetailView(post: Post) -> DetailView
}
