//
//  Config.swift
//  iOS-Clone-Project
//
//  Created by 민 on 7/21/24.
//

import Foundation

enum Config {
    enum Network {
        static let apiKey = "API_KEY"
    }
    
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("plist cannot found.")
        }
        return dict
    }()
}

extension Config {
    static let baseURL: String = "https://api.openweathermap.org/data/2.5/weather"
}
