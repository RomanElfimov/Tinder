//
//  CardImageScroller.swift
//  TinderApp
//
//  Created by Роман Елфимов on 26.12.2021.
//

import SwiftUI
import Kingfisher

struct CardImageScroller: View {
    
    var person: Person
    
    @State private var imageIndex = 0
    @Binding var fullscreenMode: Bool
    
    func updateImageIndex(addition: Bool) {
        let newIndex: Int
        
        if addition {
            newIndex = imageIndex + 1
        } else {
            newIndex = imageIndex - 1
        }
        
        imageIndex = min(max(0, newIndex), person.imageURLs.count - 1)
    }
    
    // Like, nope button
    let screenCuttoff = (UIScreen.main.bounds.width / 2) * 0.4
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                ZStack {
                    KFImage(person.imageURLs[imageIndex])
                        .placeholder {
                            Color.white
                        }
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geo.size.width, height: geo.size.height)
                        .clipped()
                    
                    VStack {
                        HStack {
                            Image("likeButton")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 150)
                                .opacity(Double(person.x / screenCuttoff) - 1)
                            
                            Spacer()
                            
                            Image("nopeButton")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 150)
                                .opacity(Double(person.x / screenCuttoff * -1 - 1))
                        }
                        
                        Spacer()
                    }
                    
                    HStack {
                        Rectangle()
                            .onTapGesture {
                                updateImageIndex(addition: false)
                            }
                        
                        Rectangle()
                            .onTapGesture {
                                updateImageIndex(addition: true)
                            }
                    }
                    .foregroundColor(Color.white.opacity(0.01))
                }
                
                // Полоска сверху - какая картинка выбрана
                VStack {
                    HStack {
                        ForEach(0..<person.imageURLs.count) { imageIndex in
                            RoundedRectangle(cornerRadius: 20)
                                .frame(height: 4)
                                .foregroundColor(self.imageIndex == imageIndex ? Color.white : Color.gray.opacity(0.5))
                        }
                    }
                    .padding(.top, 6)
                    .padding(.horizontal, fullscreenMode ? 0 : 12)
                    
                    Spacer()
                    
                    // User's name, age, description
                    if !fullscreenMode {
                        HStack {
                            VStack(alignment: .leading) {
                                HStack {
                                    Text(person.name)
                                        .font(.system(size: 32, weight: .heavy))
                                    
                                    Text(String(person.age))
                                        .font(.system(size: 28, weight: .light))
                                }
                                
                                Text(person.bio)
                                    .font(.system(size: 18, weight: .medium))
                                    .lineLimit(2)
                            }
                            
                            Spacer()
                            
                            Button {
                                fullscreenMode = true
                            } label: {
                                Image(systemName: "info.circle.fill")
                                    .font(.system(size: 26, weight: .medium))
                            }
                        }
                        .padding(16)
                    }
                }
                .foregroundColor(Color.white)
            }
            .cornerRadius(6)
            .shadow(radius: 5)
        }
    }
}

struct CardImageScroller_Previews: PreviewProvider {
    static var previews: some View {
        CardImageScroller(person: Person.expample, fullscreenMode: .constant(true))
    }
}
