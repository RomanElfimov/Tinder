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
    var bio: String
}


extension Person {
    static let expample = Person(
        name: "Alex",
        imageURLs: [URL(string: "https://picsum.photos/400/300")!],
        bio: "This is my bio"
    )
    
    static let expample2 = Person(
        name: "Samantha",
        imageURLs: [URL(string: "https://picsum.photos/400/301")!],
        bio: "I really love dogs"
    )
}
