//
//  LikesView.swift
//  TinderApp
//
//  Created by Роман Елфимов on 11.12.2021.
//

import SwiftUI

struct LikesView: View {
    @EnvironmentObject var userMng: UserManager
    @EnvironmentObject var appState: AppStateManager
    
    private var user: User {
        return userMng.currentUser
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            if !user.goldSubscriber {
                Text("Upgrader to Gold to see people who already liked you.")
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
                        PersonSquare(person: person, blur: !user.goldSubscriber)
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

struct LikesView_Previews: PreviewProvider {
    static var previews: some View {
        LikesView()
            .environmentObject(UserManager())
            .environmentObject(AppStateManager())
    }
}
