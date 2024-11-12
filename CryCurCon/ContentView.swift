//
//  ContentView.swift
//  CryCurCon
//
//  Created by Varun Mehra on 09/11/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: BottomBarSelectedTab = .home

    var body: some View {
        VStack {
            switch selectedTab {
            case .home:
                HomeView()
            case .search:
                SearchView()
            case .plus:
                Text("Add")
            case .notification:
                NotificationView()
            case .profile:
                ProfileView()
            }
            Spacer()
            BottomBar(selectedTab: $selectedTab)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



   


