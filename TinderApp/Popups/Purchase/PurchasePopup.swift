//
//  PurchasePopup.swift
//  TinderApp
//
//  Created by Роман Елфимов on 12.12.2021.
//

import SwiftUI

struct PurchasePopup: View {
    
    @Binding var isVisible: Bool
    
    @State private var selectedIndex: Int = 1
    
    let screen = UIScreen.main.bounds
    let subscriptions: [Subscription] = [
        Subscription.example1,
        Subscription.example2,
        Subscription.example3
    ]
    
    func processPayment() {
        // placeholder function
        //        let product = subscriptions[selectedIndex]
    }
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                Spacer().frame(height: 40)
                
                VStack {
                    Text("Get Tinder Gold")
                        .foregroundColor(.yellow)
                        .font(.system(size: 24, weight: .bold))
                    
                    
                    // Swipe Promo
                    PurchaseSwipePromo()
                        .frame(height: geo.size.height / 3)
                        .padding(.top, -35)
                    
                    
                    
                    // Options
                    HStack {
                        ForEach(subscriptions.indices) { subindex in
                            let sub = subscriptions[subindex]
                            
                            PurchaseOptionView(sub: sub, isSelected: subindex == selectedIndex)
                                .onTapGesture {
                                    selectedIndex = subindex
                                }
                        }
                    }
                    
                    
                    Spacer()
                    
                    
                    // Continue button
                    Button {
                        processPayment()
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 45)
                                .foregroundColor(.yellow)
                            
                            Text("CONTINUE")
                                .foregroundColor(.white)
                                .font(.system(size: 20, weight: .heavy))
                        }
                    }
                    .frame(height: 55)
                    .padding(.horizontal, 24)
                    .padding(.top, 12)
                    
                    Button {
                        isVisible = false
                    } label: {
                        Text("NO THANKS")
                            .foregroundColor(.textPrimary)
                            .font(.system(size: 20, weight: .heavy))
                    }
                    .padding(.vertical, 18)
                    
                    Spacer()
                }
                .frame(width: geo.size.width)
                .padding(.vertical, 12)
                .background(
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .foregroundColor(.white)
                )
                
                Spacer()
                
                VStack(spacing: 4) {
                    Text("Recurring billing, cancel anytime.")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .semibold))
                    Text("This is a bunch of example text that is representing the legal text found on all subscription pages. Out of respect to the original application we will not be copying over their legal text word for word here.")
                        .foregroundColor(Color.white.opacity(0.5))
                        .font(.system(size: 14, weight: .semibold))
                        .multilineTextAlignment(.center)
                }
                .padding(.bottom, 20)
                .padding(.horizontal, 4)
                
                Spacer()
            }
            .background(Color.black.edgesIgnoringSafeArea(.all))
        }
        .frame(height: screen.height)
    }
}

struct PurchasePopup_Previews: PreviewProvider {
    
    static var previews: some View {
        PurchasePopup(isVisible: .constant(false))
    }
}
