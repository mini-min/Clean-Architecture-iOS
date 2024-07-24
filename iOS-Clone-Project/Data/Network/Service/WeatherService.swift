//
//  WeatherService.swift
//  iOS-Clone-Project
//
//  Created by 민 on 7/21/24.
//

import Foundation
import Moya

protocol WeatherServiceProtocol {
    func getWeatherLocation(location: String,
                            completion: @escaping (Result<WeatherEntity, Error>) -> Void)
}

final class WeatherService: WeatherServiceProtocol {
    
    static let shared = WeatherService()
    private let provider = MoyaProvider<BaseAPI>(plugins: [MoyaLoggerPlugin()])
    
    private init() {}
    
    func getWeatherLocation(location: String,
                            completion: @escaping (Result<WeatherEntity, Error>) -> Void) {
        provider.request(.getWeatherLocation(location: location)) { result in
            switch result {
            case .success(let response):
                do {
                    let decoder = JSONDecoder()
                    let networkResult = try decoder.decode(WeatherEntity.self, from: response.data)
                    completion(.success(networkResult))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
