//
//  Coordinator.swift
//  iOS-Clone-Project
//
//  Created by 민 on 7/31/24.
//

import Foundation

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    func start()
}
