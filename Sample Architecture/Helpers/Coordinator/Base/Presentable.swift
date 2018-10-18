//
//  Presentable.swift
//  Sample Architecture
//
//  Created by Fathony Teguh Irawan on 18/10/18.
//  Copyright © 2018 Fathony Teguh Irawan. All rights reserved.
//
import UIKit

protocol Presentable {
    func toPresent() -> UIViewController?
}

extension UIViewController: Presentable {
    
    func toPresent() -> UIViewController? {
        return self
    }
}
