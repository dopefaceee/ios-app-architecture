//
//  DetailView.swift
//  Sample Architecture
//
//  Created by Fathony Teguh Irawan on 21/10/18.
//  Copyright © 2018 Fathony Teguh Irawan. All rights reserved.
//

import Foundation

protocol DetailView: BaseView {
    var post: Post? { get set }
}
