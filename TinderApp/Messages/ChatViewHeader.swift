//
//  ChatViewHeader.swift
//  TinderApp
//
//  Created by Роман Елфимов on 07.12.2021.
//

import SwiftUI

struct ChatViewHeader: View {
    @Environment(\.presentationMode) var presentationMode
    
    let name: String
    let imageURL: URL?
    let videoAction: () -> Void
    
    var body: some View {
        ZStack {
            Color.white
                .edgesIgnoringSafeArea(.top)
                .shadow(radius: 3)
            
            HStack {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(Color.textPrimary)
                        .font(.system(size: 28, weight: .semibold))
                }
                
                Spacer()
                
                // Avatar & User name
                VStack(spacing: 6) {
                    RoundedImage(url: imageURL)
                        .frame(height: 45)
                    
                    Text(name)
                        .foregroundColor(Color.textSecondary)
                        .font(.system(size: 14))
                }
                
                Spacer()
                
                // Video Button
                Button {
                    videoAction()
                } label: {
                    Image(systemName: "video.fill")
                        .font(.system(size: 20, weight: .bold))
                }
            }
            .padding(.horizontal, 22)
            .padding(.vertical, 10)
        }
        .frame(height: 50)
    }
}

struct ChatViewHeader_Previews: PreviewProvider {
    static var previews: some View {
        let person = Person.expample
        ChatViewHeader(name: person.name, imageURL: person.imageURLs.first, videoAction: {
            //
        })
    }
}
