//
//  DataServices.swift
//  SneaksAndLadders
//
//  Created by radioshaolin on 11.10.18.
//  Copyright © 2018 Radio Shaolin. All rights reserved.
//

import Foundation

public struct Services {
    var dataService: DataService
    
    public init() {
        self.dataService = DataService()
    }
}

struct User {
    let nickname: String
    var userPic: Data?
    
    init(nickname: String) {
        self.nickname = nickname
    }
}

struct DataService {
    var users: [User] = []
}


