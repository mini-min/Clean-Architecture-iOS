//
//  GenericResponse.swift
//  iOS-Clone-Project
//
//  Created by 민 on 7/21/24.
//

import Foundation

struct GenericResponse<T> {
    
    var code: Int
    var message: String
    var data: T?
    
    enum CodingKeys: CodingKey {
        case code
        case message
        case data
    }
}

extension GenericResponse: Decodable where T: Decodable {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        code = try values.decode(Int.self, forKey: .code)
        message = try values.decode(String.self, forKey: .message)
        data = try values.decode(T.self, forKey: .data)
    }
}
