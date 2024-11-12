//
//  bottomBarView.swift
//  CryCurCon
//
//  Created by Varun Mehra on 11/11/24.
//

import SwiftUI

enum BottomBarSelectedTab: Int {
    case home, search, plus, notification, profile
}

struct BottomBar: View {
    @Binding var selectedTab: BottomBarSelectedTab

    var body: some View {
        HStack(spacing: 0) {
            
            // Home Button
            Button(action: { selectedTab = .home }) {
                BottomBarButtonView(image: "house.fill", text: "Home", isActive: selectedTab == .home)
            }
            .frame(maxWidth: .infinity)

            // Search Button
            Button(action: { selectedTab = .search }) {
                BottomBarButtonView(image: "magnifyingglass", text: "Search", isActive: selectedTab == .search)
            }
            .frame(maxWidth: .infinity)

            // Plus Button (Center)
            Button(action: { selectedTab = .plus }) {
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .frame(width: 60, height: 60)
                        .foregroundColor(.black)
                    Image(systemName: "plus")
                        .font(.title)
                        .foregroundColor(.white)
                }
            }
            .offset(y: -10)  // Raise it slightly to make it stand out
            .frame(maxWidth: .infinity)

            // Notification Button
            Button(action: { selectedTab = .notification }) {
                BottomBarButtonView(image: "bell", text: "Notification", isActive: selectedTab == .notification)
            }
            .frame(maxWidth: .infinity)

            // Profile Button
            Button(action: { selectedTab = .profile }) {
                BottomBarButtonView(image: "person", text: "Profile", isActive: selectedTab == .profile)
            }
            .frame(maxWidth: .infinity)
        }
        .frame(height: 60)
        .padding(.horizontal)
        .background(Color("PrimaryWhite").ignoresSafeArea())
        .shadow(color: Color("PrimaryBlack").opacity(0.1), radius: 10)
    }

}

struct BottomBarButtonView: View {
    var image: String
    var text: String
    var isActive: Bool

    var body: some View {
        VStack(spacing: 3) {
            Image(systemName: image)
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(isActive ? .orange : .gray)
            Text(text)
                .font(.caption)
                .foregroundColor(isActive ? .orange : .gray)
        }
    }
}

struct BottomBar_Previews: PreviewProvider {
    static var previews: some View {
        BottomBar(selectedTab: .constant(.home))
    }
}
