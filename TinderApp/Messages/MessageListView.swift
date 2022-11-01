//
//  MessageListView.swift
//  TinderApp
//
//  Created by Роман Елфимов on 08.12.2021.
//

import SwiftUI

struct MessageListView: View {
    @ObservedObject var viewModel: MessageListViewModel = MessageListViewModel()
    
    @State private var searchText: String = ""
    @State private var isEditing: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    TextField("Search Matches", text: $searchText)
                        .padding(7)
                        .padding(.horizontal, 25)
                        .background(Color.textfieldBG)
                        .cornerRadius(8)
                        .overlay(
                            HStack {
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(.textPrimary)
                                    .font(.system(size: 20, weight: .bold))
                                    .padding(.leading, 4)
                                
                                Spacer()
                            }
                        )
                        .padding(.horizontal, 10)
                        .onTapGesture {
                            self.isEditing = true
                        }
                        .animation(.easeIn(duration: 0.25))
                    
                    if isEditing {
                        Button {
                            self.isEditing = false
                            self.searchText = ""
                            self.endEditing(true) // hide keyboard
                        } label: {
                            Text("Cancel")
                        }
                        .padding(.trailing, 12)
                        .transition(.move(edge: .trailing))
                        .animation(.easeIn(duration: 0.25))
                    }
                }
                
                Spacer().frame(height: 14)
                
                ZStack {
                    VStack {
                        ForEach(viewModel.messagePreviews.filter({ searchText.isEmpty ? true : displayPreview($0) }), id: \.self) { preview in
                            
                            NavigationLink {
                                ChatView(person: preview.person)
                            } label: {
                                MessageRowView(preview: preview)
                            }
                            .buttonStyle(PlainButtonStyle())
                            .animation(.easeIn(duration: 0.25))
                            .transition(.slide)
                        }
                    }
                    
                    if isEditing && searchText.isEmpty {
                        Color.white.opacity(0.5)
                    }
                }
                
                
                Spacer()
            }
        }
        .modifier(HideNavigationView())
    }
    
    
    // Search Filter method
    func displayPreview(_ preview: MessagePreview) -> Bool {
        //person name
        if preview.person.name.contains(searchText) { return true }
        
        // last message sent
        if preview.lastMessage.contains(searchText) { return true }
        
        // person bio
        if preview.person.bio.contains(searchText) { return true }
        
        return false
    }
}

struct MessageListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MessageListView()
        }
    }
}
