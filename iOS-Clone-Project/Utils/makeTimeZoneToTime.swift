//
//  makeTimeZoneToTime.swift
//  iOS-Clone-Project
//
//  Created by 민 on 7/23/24.
//

import Foundation

/**
 - TimeZone 타입의 시간을 String 타입의 HH:mm 형태로 바꾸는 Extension입니다.
 
 - Parameter : timeZone(Int 타입)
 - Return : DataFormatter "HH:mm"이 적용된 String 타입
*/

extension NSObject {
    func makeTimeZoneToTime(timeZone: Int) -> String {
        let today = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(secondsFromGMT: timeZone)
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: today)
    }
}
