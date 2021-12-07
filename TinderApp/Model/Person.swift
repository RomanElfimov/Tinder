//
//  Person.swift
//  TinderApp
//
//  Created by Роман Елфимов on 06.12.2021.
//

import Foundation

struct Person: Hashable {
    var name: String
    var imageURLs: [URL]
}


extension Person {
    static let expample = Person(name: "Alex", imageURLs: [URL(string: "https://picsum.photos/400")!])
}
