//
//  WeatherListRepository.swift
//  iOS-Clone-Project
//
//  Created by 민 on 7/21/24.
//

import Foundation

final class DefaultWeatherRepository {
    
    private let weatherService: WeatherServiceProtocol
    
    init(weatherService: WeatherServiceProtocol) {
        self.weatherService = weatherService
    }
}

extension DefaultWeatherRepository: WeatherRepository {
    
    func fetchWeather(location: String,
                      completion: @escaping (Result<CityWeather, Error>) -> Void) {
        weatherService.getWeatherLocation(location: location) { result in
            switch result {
            case .success(let entity):
                let model = CityWeather(location: entity.name,
                                             time: entity.timezone,
                                             weather: entity.weather.first?.main ?? "",
                                             temp: Int(entity.main.temp),
                                             maxTemp: Int(entity.main.tempMax),
                                             minTemp: Int(entity.main.tempMin))
                completion(.success(model))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
