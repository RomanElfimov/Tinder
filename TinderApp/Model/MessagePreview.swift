//
//  MessageThread.swift
//  TinderApp
//
//  Created by Роман Елфимов on 06.12.2021.
//

import Foundation

struct MessagePreview: Hashable {
    var person: Person
    var lastMessage: String
}


extension MessagePreview {
    static let example = MessagePreview(person: Person.expample, lastMessage: "Hello there. How are you?")
    
    static let examples: [MessagePreview] = [
        MessagePreview(person: Person.expample, lastMessage: "Hello there. How are you?"),
        MessagePreview(person: Person.expample2, lastMessage: "Hi there")
    ]
}
