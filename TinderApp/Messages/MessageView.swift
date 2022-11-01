//
//  MessageView.swift
//  TinderApp
//
//  Created by Роман Елфимов on 06.12.2021.
//

import SwiftUI

// Contains single chat buble
struct MessageView: View {
    var message: Message
    
    var body: some View {
        
        HStack {
            if message.fromCurrentUser {
                Spacer()
            }
            
            Text(message.content)
                .padding(10)
                .foregroundColor(.white)
                .background(message.fromCurrentUser ? Color.blue: Color.gray)
                .cornerRadius(10)
            
            if !message.fromCurrentUser {
                Spacer()
            }
        }
        .padding()
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(message: Message.exampleReceived)
    }
}
