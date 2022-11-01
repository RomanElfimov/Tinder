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
            URL(string: "https://loremflickr.com/320/253")!,
            URL(string: "https://loremflickr.com/320/254")!,
            URL(string: "https://loremflickr.com/320/255")!,
            URL(string: "https://loremflickr.com/320/256")!
        ],
        bio: "This is my bio. This is my bio. This is my bio. This is my bio.",
        age: 21,
        distance: 20,
        bioLong: "This is my bio. This is my bio. This is my bio. This is my bio."
    )
    
    static let expample2 = Person(
        name: "Samantha",
        imageURLs: [URL(string: "https://loremflickr.com/320/240")!],
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
                URL(string: "https://loremflickr.com/320/241")!,
                URL(string: "https://loremflickr.com/320/242")!,
                URL(string: "https://loremflickr.com/320/243")!,
                URL(string: "https://loremflickr.com/320/244")!
               ],
               bio: "I love hiking",
               age: 30,
               distance: 30,
               bioLong: "This is my bio. This is my bio. This is my bio. This is my bio."),
        Person(name: "Sophia",
               imageURLs: [
                URL(string: "https://loremflickr.com/320/245")!,
                URL(string: "https://loremflickr.com/320/246")!,
                URL(string: "https://loremflickr.com/320/247")!,
                URL(string: "https://loremflickr.com/320/248")!
               ],
               bio: "I am realy boring",
               age: 28,
               distance: 40,
               bioLong: "This is my bio. This is my bio. This is my bio. This is my bio."),
        Person(name: "Mia",
               imageURLs: [
                URL(string: "https://loremflickr.com/320/249")!,
                URL(string: "https://loremflickr.com/320/250")!,
                URL(string: "https://loremflickr.com/320/251")!,
                URL(string: "https://loremflickr.com/320/252")!
               ],
               bio: "I like to skateboard",
               age: 22,
               distance: 50,
               bioLong: "This is my bio. This is my bio. This is my bio. This is my bio.")
    ]
}

// https://api.lorem.space/image?w=200&h=301
