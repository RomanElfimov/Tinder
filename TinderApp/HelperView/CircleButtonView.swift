//
//  CircleButtonView.swift
//  TinderApp
//
//  Created by Роман Елфимов on 27.12.2021.
//

import SwiftUI

// 5 types of button
enum ButtonType: String {
    case back = "gobackward"
    case no = "xmark"
    case star = "star.fill"
    case heart = "heart.fill"
    case lightning = "cloud.bolt.fill"
}


// Button Style
struct CircleButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        // Effect of pressing the button
        configuration.label
            .background(
                Circle()
                    .foregroundColor(Color.white)
            )
            .scaleEffect(configuration.isPressed ? 0.7 : 1.0)
    }
}


// Color Modifier
struct ColorButton: ViewModifier {
    var type: ButtonType
    
    func body(content: Content) -> some View {
        switch type {
        case .back:
            return AnyView(
                content
                    .foregroundColor(.yellow)
            )
            
        case .no:
            return AnyView(
                content
                    .foregroundColor(.red)
            )
            
        case .star:
            return AnyView(
                content
                    .foregroundColor(.blue)
            )
            
        case .heart:
            return AnyView(
                content
                    .foregroundColor(.green)
            )
            
        case .lightning:
            return AnyView(
                content
                    .foregroundColor(.purple)
            )
        }
    }
}



extension View {
    func colorButton(type: ButtonType) -> some View {
        self.modifier(ColorButton(type: type))
    }
}


struct CircleButtonView: View {
    var type: ButtonType
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: type.rawValue)
                .resizable()
                .font(.system(size: 12, weight: .bold))
                .aspectRatio(contentMode: .fit)
                .padding(12)
        }
        
        .buttonStyle(CircleButton())
        .colorButton(type: type)
    }
}

struct CircleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray.opacity(0.2)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 50) {
                CircleButtonView(type: .back) {
                    // Some closure
                }
                .frame(height: 50)
                CircleButtonView(type: .no) {
                    // Some closure
                }
                .frame(height: 50)
                CircleButtonView(type: .star) {
                    // Some closure
                }
                .frame(height: 50)
                CircleButtonView(type: .heart) {
                    // Some closure
                }
                .frame(height: 50)
                CircleButtonView(type: .lightning) {
                    // Some closure
                }
                .frame(height: 50)
            }
        }
        
    }
}
