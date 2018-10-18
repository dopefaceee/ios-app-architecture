//
//  NSObjectExtension.swift
//  Sample Architecture
//
//  Created by Fathony Teguh Irawan on 18/10/18.
//  Copyright © 2018 Fathony Teguh Irawan. All rights reserved.
//

import Foundation

extension NSObject {
    
    class var nameOfClass: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}
