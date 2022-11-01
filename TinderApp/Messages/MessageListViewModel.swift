//
//  MessageListViewModel.swift
//  TinderApp
//
//  Created by Роман Елфимов on 08.12.2021.
//

import Foundation

class MessageListViewModel: ObservableObject {
    @Published var messagePreviews: [MessagePreview] = []
    
    init() {
        loadPreviews()
    }
    
    func loadPreviews() {
        // Handle networking to load messagePreviews from a server
        self.messagePreviews = MessagePreview.examples
    }
}
