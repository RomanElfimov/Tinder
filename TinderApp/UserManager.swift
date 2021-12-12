//
//  UserManager.swift
//  TinderApp
//
//  Created by Роман Елфимов on 11.12.2021.
//

import Foundation

class UserManager: ObservableObject {
    @Published var currentUser: User = User(name: "")
    @Published var matches: [Person] = []
    @Published var topPicks: [Person] = []
    
    init() {
        loadUser()
        loadMatches()
        loadTopPicks()
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
}



