//
//  Person.swift
//  TinderApp
//
//  Created by Роман Елфимов on 06.12.2021.
//

import SwiftUI

struct Person: Hashable, Identifiable {
    let id = UUID().uuidString
    
    var name: String
    var imageURLs: [URL]
    var bio: String
    var age: Int
    var distance: Int
    
    var bioLong: String
    
    // Used for card manipulation
    var x: CGFloat = 0.0
    var y: CGFloat = 0.0
    var degree: Double = 0.0
}


extension Person {
    static let expample = Person(
        name: "Alex",
        imageURLs: [
            URL(string: "https://picsum.photos/400/300")!,
            URL(string: "https://picsum.photos/400/301")!,
            URL(string: "https://picsum.photos/400/302")!,
            URL(string: "https://picsum.photos/400/303")!
        ],
        bio: "This is my bio. This is my bio. This is my bio. This is my bio.",
        age: 21,
        distance: 20,
        bioLong: "This is my bio. This is my bio. This is my bio. This is my bio."
    )
    
    static let expample2 = Person(
        name: "Samantha",
        imageURLs: [URL(string: "https://picsum.photos/400/301")!],
        bio: "I really love dogs",
        age: 25,
        distance: 25,
        bioLong: "This is my bio. This is my bio. This is my bio. This is my bio."
    )
    
    static let expamples: [Person] = [
        Person.expample,
        Person.expample2,
        Person(name: "Olivia",
               imageURLs: [
                URL(string: "https://picsum.photos/400/302")!,
                URL(string: "https://picsum.photos/400/303")!,
                URL(string: "https://picsum.photos/400/304")!,
                URL(string: "https://picsum.photos/400/305")!
               ],
               bio: "I love hiking",
               age: 30,
               distance: 30,
               bioLong: "This is my bio. This is my bio. This is my bio. This is my bio."),
        Person(name: "Sophia",
               imageURLs: [
                URL(string: "https://picsum.photos/400/306")!,
                URL(string: "https://picsum.photos/400/307")!,
                URL(string: "https://picsum.photos/400/308")!,
                URL(string: "https://picsum.photos/400/309")!
               ],
               bio: "I am realy boring",
               age: 28,
               distance: 40,
               bioLong: "This is my bio. This is my bio. This is my bio. This is my bio."),
        Person(name: "Mia",
               imageURLs: [
                URL(string: "https://picsum.photos/400/310")!,
                URL(string: "https://picsum.photos/400/311")!,
                URL(string: "https://picsum.photos/400/312")!,
                URL(string: "https://picsum.photos/400/313")!
               ],
               bio: "I like to skateboard",
               age: 22,
               distance: 50,
               bioLong: "This is my bio. This is my bio. This is my bio. This is my bio.")
    ]
}
