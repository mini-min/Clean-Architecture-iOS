//
//  Observable.swift
//  iOS-Clone-Project
//
//  Created by 민 on 7/21/24.
//

import Foundation

/**
 - 데이터의 상태 변화를 간편하게 관리하기 위한 Observable 사용법
 
 1. 애플리케이션에서 사용하는 데이터 타입을 해당 Observable 타입으로 지정합니다. (init 메서드에서 초기 데이터 값을 저장)
    예: let observableString = Observable<String>("Initial Value")
 
 2. 데이터 바인딩은 bind 함수로 진행합니다. bind 함수는 데이터를 수신하는 클로저를 매개변수로 받습니다.
    예: observableString.bind { newValue in
            print("Value changed to \(newValue)")
        }
 
 3. 값이 변할 때, value의 didSet 구문으로 체킹할 수 있습니다. 이때 listener 클로저에서 새로운 값이 전달됩니다.
    예: observableInt.value = 42 // 이 시점에서 listener 클로저가 호출되어 값이 변경됨을 알립니다.
*/
final class Observable<T> {
    typealias Listener = (T) -> Void
    var listener: Listener?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(_ listener: @escaping Listener) {
        self.listener = listener
        listener(value)
    }
}
