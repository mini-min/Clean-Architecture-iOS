//
//  ViewControllerFactory.swift
//  iOS-Clone-Project
//
//  Created by 민 on 7/22/24.
//

import UIKit

protocol ViewControllerFactoryProtocol {
    func makeWeatherListVC() -> WeatherListViewController
}

final class ViewControllerFactory: ViewControllerFactoryProtocol {
    
    static let shared = ViewControllerFactory()
    private init() { }
    
    func makeWeatherListVC() -> WeatherListViewController {
        let repository = DefaultWeatherRepository(weatherService: WeatherService.shared)
        let usecase = DefaultWeatherUseCase(repository: repository)
        let viewModel = DefaultWeatherListViewModel(fetchWeatherUsecase: usecase)
        let vc = WeatherListViewController(viewModel: viewModel)
        return vc
    }
}
