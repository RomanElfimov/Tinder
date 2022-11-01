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
    var age: Int
    var jobTitle: String
    var imageURLS: [URL] = []
    
    var goldSubscriber: Bool = false
    var profileTip: String = ""
}


extension User {
    static let example = User(
        name: "Alex",
        age: 21,
        jobTitle: "Software Engineer",
        imageURLS: [URL(string: "https://loremflickr.com/320/260")!],
        goldSubscriber: true,
        profileTip: "Photo Tip: Make waves with a beach photo and get more likes"
    )
}
