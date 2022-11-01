//
//  PersonSquare.swift
//  TinderApp
//
//  Created by Роман Елфимов on 11.12.2021.
//

import SwiftUI
import Kingfisher

struct PersonSquare: View {
    var person: Person
    var blur: Bool
    
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .bottomLeading) {
                KFImage(person.imageURLs.first)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geo.size.width, height: geo.size.height)
                    .if(blur) {
                        $0.blur(radius:  25)
                    }
                
                Text("\(person.name), \(person.age)")
                    .padding()
                    .foregroundColor(.white)
                    .font(.system(size: 18, weight: .semibold))
                    .if(blur) {
                        $0.redacted(reason: .placeholder)
                    }
            }
            .cornerRadius(16)
        }
    }
    
}

struct PersonSquare_Previews: PreviewProvider {
    static var previews: some View {
        PersonSquare(person: Person.expample, blur: false)
            .frame(width: 125, height: 125)
    }
}
