//
//  WeatherListUseCase.swift
//  iOS-Clone-Project
//
//  Created by 민 on 7/21/24.
//

import Foundation

protocol WeatherListUseCase {
    func execute(location: String, 
                 completion: @escaping (Result<CityWeather, Error>) -> Void)
}

final class DefaultWeatherUseCase: WeatherListUseCase {
    
    private let repository: WeatherRepository
    
    init(repository: WeatherRepository) {
        self.repository = repository
    }
    
    func execute(location: String, completion: @escaping (Result<CityWeather, Error>) -> Void) {
        repository.fetchWeather(location: location, completion: completion)
    }
}
