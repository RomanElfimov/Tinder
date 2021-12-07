//
//  ChatManager.swift
//  TinderApp
//
//  Created by Роман Елфимов on 07.12.2021.
//

import Foundation
import Combine
import UIKit

class ChatManager: ObservableObject {
    @Published var messages: [Message] = []
    @Published var keyboardIsShowing: Bool = false
    
    var cancellable: AnyCancellable? = nil
    
    // С кем переписываемся
    private var person: Person
    
    init(person: Person) {
        self.person = person
        loadMessages()
        
        setupPublishers()
    }
    
    public func sendMessage(_ message: Message) {
        // Networking
        messages.append(message)
    }
    
    private let keyboardWillShow = NotificationCenter.default
        .publisher(for: UIResponder.keyboardWillShowNotification)
        .map({ _ in true  })
    
    private let keyboardWillHide = NotificationCenter.default
        .publisher(for: UIResponder.keyboardWillHideNotification)
        .map({ _ in false })
    
    // Subscribe to publishers
    private func setupPublishers() {
        cancellable = Publishers.Merge(keyboardWillShow, keyboardWillHide)
            .subscribe(on: DispatchQueue.main)
            .assign(to: \.keyboardIsShowing, on: self)
    }
    
    private func loadMessages() {
        messages = [Message.exampleSent, Message.exampleReceived]
    }
    
    deinit {
        cancellable?.cancel()
    }
}
