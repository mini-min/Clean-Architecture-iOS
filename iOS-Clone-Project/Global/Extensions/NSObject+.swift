//
//  NSObject+.swift
//  iOS-Clone-Project
//
//  Created by 민 on 7/21/24.
//

import Foundation

extension NSObject {
    static var className: String {
        return String(describing: self)
    }
}
