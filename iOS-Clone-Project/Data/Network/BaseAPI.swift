//
//  BaseAPI.swift
//  iOS-Clone-Project
//
//  Created by 민 on 7/21/24.
//

import Foundation
import Moya

enum BaseAPI {
    case getWeatherLocation(location: String)
}

extension BaseAPI: TargetType {
    var baseURL: URL {
        guard let baseURL = URL(string: Config.baseURL) else {
            fatalError("[Error] - Base URL이 없습니다!")
        }
        return baseURL
    }
    
    var path: String {
        switch self {
        case .getWeatherLocation:
            return ""
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getWeatherLocation:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getWeatherLocation(let location):
            if let apiKey = Bundle.main.object(forInfoDictionaryKey: Config.Network.apiKey) {
                return .requestParameters(parameters: [
                    "units": "metric",
                    "lang": "kr",
                    "q": location,
                    "appid": apiKey
                ], encoding: URLEncoding.queryString)
            } else { return .requestPlain }
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getWeatherLocation:
            return ["Content-type": "application/json"]
        }
    }
}
