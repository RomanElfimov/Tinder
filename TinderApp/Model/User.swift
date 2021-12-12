//
//  User.swift
//  TinderApp
//
//  Created by Роман Елфимов on 11.12.2021.
//

import Foundation

// User - current user, using the app

struct User {
    var name: String
    
    var goldSubscriber: Bool = false
}


extension User {
    static let example = User(name: "Alex", goldSubscriber: false)
}
