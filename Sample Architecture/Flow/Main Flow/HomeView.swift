//
//  HomeView.swift
//  Sample Architecture
//
//  Created by Fathony Teguh Irawan on 21/10/18.
//  Copyright © 2018 Fathony Teguh Irawan. All rights reserved.
//

import Foundation

protocol HomeView: BaseView {
    var viewModel: HomeViewModel! { get set }
    var onPostSelect: ((Post) -> Void)? { get set }
}
