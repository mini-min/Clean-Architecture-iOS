//
//  WeatherRepository.swift
//  iOS-Clone-Project
//
//  Created by 민 on 7/24/24.
//

import Foundation

protocol WeatherRepository {
    func fetchWeather(location: String,
                      completion: @escaping (Result<WeatherListModel, Error>) -> Void)
}
