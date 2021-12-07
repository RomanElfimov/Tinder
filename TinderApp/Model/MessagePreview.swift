//
//  MessageThread.swift
//  TinderApp
//
//  Created by Роман Елфимов on 06.12.2021.
//

import Foundation

struct MessagePreview {
    var person: Person
    var lastMessage: String
}


extension MessagePreview {
    static let example = MessagePreview(person: Person.expample, lastMessage: "Hello there.")
}
