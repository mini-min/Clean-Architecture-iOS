//
//  AppCoordinator.swift
//  iOS-Clone-Project
//
//  Created by 민 on 7/31/24.
//

import UIKit

final class AppCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    var router: Router
    
    init(navigationController: UINavigationController, router: Router) {
        self.navigationController = navigationController
        self.router = router
    }
    
    func start() {
        let weatherListVC = ViewControllerFactory.shared.makeWeatherListVC()
        weatherListVC.coordinator = self
        router.push(weatherListVC, animated: false)
    }
    
    func showDetailWeatherViewController() {
        let detailWeatherVC = DetailWeatherViewController()
        router.push(detailWeatherVC, animated: true)
    }
}
