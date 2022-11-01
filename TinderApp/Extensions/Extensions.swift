//
//  Extensions.swift
//  TinderApp
//
//  Created by Роман Елфимов on 05.12.2021.
//

import SwiftUI

extension View {
    @ViewBuilder
    func `if`<Transform: View>(
        _ condition: Bool,
        transform: (Self) -> Transform
    ) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}


extension Color {
    static let textPrimary = Color.gray.opacity(0.9)
    static let textSecondary = Color.gray.opacity(0.6)
    static let textTitle = Color.black.opacity(0.8)
    static let defaultBackground = Color(.systemGray6).opacity(0.35)
    static let textfieldBG = Color(.systemGray6)
}


extension View {
    
    // Hide keyboard
    func endEditing(_ force: Bool) {
        UIApplication.shared.windows.forEach { $0.endEditing(force)}
    }
}


// Custom Modifier
struct HideNavigationView: ViewModifier {
    
    // Берем View, добавляем модификаторы, возвращаем view с модификаторами
    
    func body(content: Content) -> some View {
        content
            .navigationTitle("")
            .navigationBarHidden(true)
    }
}
