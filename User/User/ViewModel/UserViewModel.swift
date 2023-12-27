
//
//  UserViewModel.swift
//  User
//
//  Created by 김지훈 on 2023/12/27.
//

import Foundation
import RxSwift
import RxCocoa

class UserViewModel {
    // 입력
    let username = PublishSubject<String>()
    
    // 출력
    var isValidUsername: Observable<Bool> {
        return username
            .map { $0.count >= 3 } // 사용자 이름이 3자 이상이면 유효
            .share(replay: 1) // 마지막 값을 공유
    }
}
