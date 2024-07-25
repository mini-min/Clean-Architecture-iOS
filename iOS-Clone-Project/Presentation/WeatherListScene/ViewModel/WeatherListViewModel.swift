//
//  WeatherListViewModel.swift
//  iOS-Clone-Project
//
//  Created by 민 on 7/21/24.
//

import Foundation

protocol WeatherListViewModelInput {
    func didSearch(cities: [String])
}

protocol WeatherListViewModelOutput {
    var weathers: Observable<[CityWeather]> { get }
    var errors: Observable<String> { get }
}

protocol WeatherListViewModel: WeatherListViewModelInput, WeatherListViewModelOutput {}

final class DefaultWeatherListViewModel: WeatherListViewModel {
    
    private let useCase: WeatherListUseCase

    // MARK: - OUTPUT
    
    var weathers: Observable<[CityWeather]> = Observable([])
    var errors: Observable<String> = Observable("")
        
    init(fetchWeatherUsecase: WeatherListUseCase) {
        self.useCase = fetchWeatherUsecase
    }
    
    private func load(for cities: [String]) {
        let group = DispatchGroup()
        var weatherList = [CityWeather]()
        var errorList = [Error]()
        
        for city in cities {
            group.enter()
            useCase.execute(location: city) { result in
                switch result {
                case .success(let model):
                    weatherList.append(model)
                case .failure(let error):
                    errorList.append(error)
                }
                group.leave()
            }
        }
        
        group.notify(queue: .main) {
            if !errorList.isEmpty {
                self.errors.value = NSLocalizedString("Failed loading data", comment: "")
            } else {
                self.weathers.value = weatherList
            }
        }
    }
}

// MARK: - INPUT

extension DefaultWeatherListViewModel {
    func didSearch(cities: [String]) {
        load(for: cities)
    }
}
