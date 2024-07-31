//
//  Router.swift
//  iOS-Clone-Project
//
//  Created by 민 on 7/31/24.
//

import UIKit

protocol RouterProtocol {
    func push(_ viewController: UIViewController, animated: Bool)
    func pop(animated: Bool)
}

final class Router: RouterProtocol {
    
    private weak var navigationController: UINavigationController?
    private var completions: [UIViewController : () -> Void]
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.completions = [:]
    }

    func push(_ viewController: UIViewController, animated: Bool) {
        navigationController?.pushViewController(viewController, animated: animated)
    }
    
    func pop(animated: Bool) {
        navigationController?.popViewController(animated: animated)
    }
}
