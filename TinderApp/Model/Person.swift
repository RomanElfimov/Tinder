//
//  Person.swift
//  TinderApp
//
//  Created by Роман Елфимов on 06.12.2021.
//

import Foundation

struct Person: Hashable, Identifiable {
    let id = UUID().uuidString
    
    var name: String
    var imageURLs: [URL]
    var bio: String
    var age: Int
}


extension Person {
    static let expample = Person(
        name: "Alex",
        imageURLs: [URL(string: "https://picsum.photos/400/300")!],
        bio: "This is my bio",
        age: 21
    )
    
    static let expample2 = Person(
        name: "Samantha",
        imageURLs: [URL(string: "https://picsum.photos/400/301")!],
        bio: "I really love dogs",
        age: 25
    )
    
    static let expamples: [Person] = [
        Person.expample,
        Person.expample2,
        Person(name: "Olivia",
               imageURLs: [URL(string: "https://picsum.photos/400/302")!],
               bio: "I love hiking",
               age: 30),
        Person(name: "Sophia",
               imageURLs: [URL(string: "https://picsum.photos/400/303")!],
               bio: "I am realy boring",
               age: 28),
        Person(name: "Mia",
               imageURLs: [URL(string: "https://picsum.photos/400/304")!],
               bio: "I like to skateboard",
               age: 22)
    ]
}
