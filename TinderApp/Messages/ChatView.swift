//
//  ChatView.swift
//  TinderApp
//
//  Created by Роман Елфимов on 07.12.2021.
//

import SwiftUI

struct ChatView: View {
    
    @ObservedObject var chatMng: ChatManager
    
    @State private var typingMessage: String = ""
    
    @State private var scrollProxy: ScrollViewProxy? = nil
    
    private var person: Person
    
    init(person: Person) {
        self.person = person
        self.chatMng = ChatManager(person: person)
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack {
                Spacer().frame(height: 65)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    ScrollViewReader { proxy in
                        
                        LazyVStack {
                            ForEach(chatMng.messages.indices, id: \.self) { index in
                                let msg = chatMng.messages[index]
                                MessageView(message: msg)
                                    .animation(.easeIn)
                                    .transition(.move(edge: .trailing))
                                    .id(index)
                            }
                        }
                        .onAppear {
                            scrollProxy = proxy
                        }
                    }
                }
                
                // Chat Bar
                ZStack(alignment: .trailing) {
                    Color.textfieldBG
                    
                    TextField("Type a message", text: $typingMessage)
                        .foregroundColor(Color.textPrimary)
                        .textFieldStyle(PlainTextFieldStyle())
                        .frame(height: 45)
                        .padding(.horizontal)
                    
                    Button {
                        
                        sendMessage()
                        
                    } label: {
                        Text("Send")
                    }
                    .padding(.horizontal)
                    .foregroundColor(typingMessage.isEmpty ? Color.textPrimary : Color.blue)
                    
                }
                .frame(height: 40)
                .cornerRadius(20)
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray.opacity(0.3), lineWidth: 1))
                .padding(.horizontal)
                .padding(.bottom)
            }
            
            // Header
            ChatViewHeader(name: person.name,
                           imageURL: person.imageURLs.first) {
                // Video Action
            }
        }
        .modifier(HideNavigationView())
        .onChange(of: chatMng.keyboardIsShowing) { value in
            if value {
                // Scroll to the bottom
                scrollToBottom()
            }
        }
        .onChange(of: chatMng.messages) { _ in
            scrollToBottom()
        }
    }
    
    func sendMessage() {
        chatMng.sendMessage(Message(content: typingMessage))
        typingMessage = ""
    }
    
    // Scroll to the bottom
    func scrollToBottom() {
        withAnimation {
            scrollProxy?.scrollTo(chatMng.messages.count - 1, anchor: .bottom)
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(person: Person.expample)
    }
}
