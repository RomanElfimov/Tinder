//
//  TopPicksView.swift
//  TinderApp
//
//  Created by Роман Елфимов on 12.12.2021.
//

import SwiftUI

struct TopPicksView: View {
    @EnvironmentObject var userMng: UserManager
    @EnvironmentObject var appState: AppStateManager
    
    private var user: User {
        return userMng.currentUser
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            if !user.goldSubscriber {
                Text("Upgrader to Tinder Gold for more Top Picks!")
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .foregroundColor(.textTitle)
                    .font(.system(size: 16, weight: .medium))
                    .padding(.horizontal, 40)
                    .padding(.vertical, 24)
            }
            
            // Columns
            LazyVGrid(
                columns: [GridItem(.flexible()), GridItem(.flexible())],
                alignment: .center,
                spacing: nil,
                pinnedViews: []) {
                    
                    // Loop over Likes
                    ForEach(userMng.matches) { person in
                        PersonSquare(person: person, blur: false)
                            .frame(height: 240)
                            .onTapGesture {
                                personTapped(person)
                            }
                    }
                }
                .padding(.horizontal, 6)
        }
    }
    
    
    // Куда перейти по тапу на Лайк
    func personTapped(_ person: Person) {
        // Если платный аккаунт, показываем профиль
        if user.goldSubscriber {
            appState.showPersonsProfile(person)
            
            // Если бесплатный, предлагаем купить
        } else {
            appState.showPurchaseScreen()
        }
    }
}

struct TopPicksView_Previews: PreviewProvider {
    static var previews: some View {
        TopPicksView()
            .environmentObject(UserManager())
            .environmentObject(AppStateManager())
    }
}

