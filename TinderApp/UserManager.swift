//
//  UserManager.swift
//  TinderApp
//
//  Created by Роман Елфимов on 11.12.2021.
//

import Foundation

class UserManager: ObservableObject {
    @Published var currentUser: User = User(name: "", age: 0, jobTitle: "")
    @Published var matches: [Person] = []
    @Published var topPicks: [Person] = []
    @Published var cardPeople: [Person] = []
    
    init() {
        loadUser()
        loadMatches()
        loadTopPicks()
        loadCardPeople()
    }
    
    private func loadCardPeople() {
        self.cardPeople = Person.expamples
    }
    
    private func loadUser() {
        self.currentUser = User.example
    }
    
    private func loadMatches() {
        self.matches = Person.expamples
    }
    
    private func loadTopPicks() {
        self.topPicks = Person.expamples.shuffled()
    }
    
    
    
    public func swipe(_ person: Person, _ direction: SwipeDirection) {
        cardPeople.removeLast()
    }
    
    public func superLike(_ person: Person) {
        cardPeople.removeLast()
    }
}




enum SwipeDirection {
    case like
    case nope
}
